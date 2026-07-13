# frozen_string_literal: true

class Day < ApplicationRecord
  has_many :games,       dependent: :destroy
  has_many :day_players, dependent: :destroy
  belongs_to :season, optional: true
  accepts_nested_attributes_for :games,       reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :day_players, reject_if: :all_blank, allow_destroy: true

  GL = 'goals_left'.freeze
  GR = 'goals_right'.freeze
  TL = 'team_left_id'.freeze
  TR = 'team_right_id'.freeze

  def day_players_by_season(season_id)
    day_players.where(season_id: season_id)
  end

  def day_rates!(dps)
    places = dps.map(&:team_id).uniq.map do |team_id|
      day_games = games.all.select { |x| [x[TL], x[TR]].include? team_id }
      next if day_games.blank?

      left_win  = day_games.select { |x| x[GL]  > x[GR] && x[TL] == team_id }
      right_win = day_games.select { |x| x[GL]  < x[GR] && x[TR] == team_id }
      draw      = day_games.select { |x| x[GL] == x[GR] }
      [(((left_win + right_win).count * 3) + draw.count) / day_games.count.to_f, team_id]
    end.compact.sort.reverse.map(&:last)
    update(first_place: places[0], second_place: places[1], third_place: places[2], fourth_place: places[3])
    print((id % 10).zero? ? id : '.')
  end

  def add_players(hash)
    s_id = season_id
    players_elo = {}
    players = Player.where(id: hash.values.flatten)
    if season.day_players.present?
      players.each do |pl|
        dpls = season.day_players.select { |x| x.player_id == pl.id }
        players_elo[pl.id] = dpls.present? ? dpls.max_by(&:day_id).new_elo : pl.elo
      end
    else
      players.each { |pl| players_elo[pl.id] = pl.elo }
    end
    day_pl = []
    hash.each do |team_id, player_ids|
      day_pl += player_ids.map { |p_id| { day_id: id, team_id: team_id, player_id: p_id, season_id: s_id, elo: players_elo[p_id]} }
    end
    DayPlayer.insert_all(day_pl)
  end

  def self.after_game(season_id, date, commands, results)
    ActiveRecord::Base.transaction do
      s = Season.find(season_id)
      day = create(season_id: s.id, date: date.to_date)
      day.add_players(commands)
      g = day.games
      dps = day.day_players
      z = [s.id, dps]
      results.split("\n").select(&:present?).each do |x|
        str = x.split(' ')
        t = str[0].split(':')
        goals = []
        if str[2].present?
          goals << str[2].split('/').join(' ')
        else
          str[1].split('-').each_with_index { |g, _| g.to_i.times { goals << "#{t[i]} 0" } if g != '0' }
        end
        eval "g.create(team_left_id: #{t[0]}, team_right_id: #{t[1]}).add_goals(z, '#{goals.join(',')}')"
      end
      day.day_rates!(dps)
      s.update_stats!(dps, day.games)
      puts 'end!'
    end
  end
end
