# frozen_string_literal: true

class Day < ApplicationRecord
  has_many :games,       dependent: :destroy
  has_many :day_players, dependent: :destroy
  belongs_to :season
  accepts_nested_attributes_for :games,       reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :day_players, reject_if: :all_blank, allow_destroy: true

  def day_players_by_season(season_id)
    day_players.where(season_id: season_id)
  end

  def day_rates!
    places = day_players.map(&:team_id).uniq.map do |team_id|
      day_games = games.all.select { |x| [x[StatService::TL], x[StatService::TR]].include? team_id }
      next if day_games.blank?

      left_win  = day_games.select { |x| x[StatService::GL]  > x[StatService::GR] && x[StatService::TL] == team_id }
      right_win = day_games.select { |x| x[StatService::GL]  < x[StatService::GR] && x[StatService::TR] == team_id }
      draw      = day_games.select { |x| x[StatService::GL] == x[StatService::GR] }
      [(((left_win + right_win).count * 3) + draw.count) / day_games.count.to_f, team_id]
    end.compact.sort.reverse.map(&:last)
    update(first_place: places[0], second_place: places[1], third_place: places[2], fourth_place: places[3])
    print((id % 10).zero? ? id : '.')
  end

  def add_players(hash)
    s_id = season_id
    players_elo = {}
    Player.where(id: hash.values.flatten).each { |pl| players_elo[pl.id] = pl.elo }
    day_pl = []
    stats = []
    hash.each do |team_id, player_ids|
      day_pl += player_ids.map { |p_id| { day_id: id, team_id: team_id, player_id: p_id, season_id: s_id, elo: players_elo[p_id]} }
      stats += player_ids.map { |p_id| { player_id: p_id, season_id: s_id, elo: players_elo[p_id] } }
    end
    DayPlayer.insert_all(day_pl)
    Stat.insert_all(stats)
  end
end
