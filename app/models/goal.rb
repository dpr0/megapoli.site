# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :team
  belongs_to :game
  belongs_to :season
  belongs_to :player, optional: true

  after_create :rate!

  private

  def rate!
    if !player_id.nil? && !assist_player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: player_id)
      stat.update(elo: stat.elo + Stat::K_ELO)
      stat = Stat.find_by(season_id: season_id, player_id: assist_player_id)
      stat.update(elo: stat.elo + Stat::K_ELO)
    elsif !player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: player_id)
      stat.update(elo: Stat::K_ELO * 2 + stat.elo)
    elsif !assist_player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: assist_player_id)
      stat.update(elo: Stat::K_ELO * 2 + stat.elo)
    end
  end
end
