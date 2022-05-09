# frozen_string_literal: true

class Day < ApplicationRecord
  has_many :games,       dependent: :destroy
  has_many :day_players, dependent: :destroy
  belongs_to :season
  accepts_nested_attributes_for :games,       reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :day_players, reject_if: :all_blank, allow_destroy: true

  after_create :create_stat! # create players stats for season

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
    hash.each do |team_id, player_ids|
      player_ids.each { |player_id| day_players.new(team_id: team_id, player_id: player_id, season_id: season_id) }
    end
  end

  private

  def create_stat!
    day_players.where(season_id: season_id)
      .each { |x| x.player.stats.find_or_initialize_by(season_id: season_id).save }
  end
end
