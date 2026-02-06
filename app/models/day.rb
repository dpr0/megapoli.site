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
end
