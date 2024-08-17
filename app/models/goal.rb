# frozen_string_literal: true

class Goal < ApplicationRecord
  belongs_to :team
  belongs_to :game
  belongs_to :season
  belongs_to :player, optional: true

  after_initialize :init_season
  after_create :game_goals
  after_create :rate!

  def add(d)
    puts :create_goal
    create(team_id: d[0], player_id: d[1], assist_player_id: d[2])
  end

  private

  def game_goals
    puts :update_goals
    if game.team_left_id == team_id
      game.update(goals_left: (game.goals_left || 0) + 1)
    elsif game.team_right_id == team_id
      game.update(goals_right: (game.goals_right || 0) + 1)
    end
  end

  def init_season
    self.season_id = game.day.season_id
  end

  def rate!
    puts :goal_rate_begin
    if !player_id.nil? && !assist_player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: player_id)
      stat.update(elo: stat.elo + Stat::K_ELO) if stat
      stat = Stat.find_by(season_id: season_id, player_id: assist_player_id)
      stat.update(elo: stat.elo + Stat::K_ELO) if stat
    elsif !player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: player_id)
      stat.update(elo: Stat::K_ELO * 2 + stat.elo) if stat
    elsif !assist_player_id.nil?
      stat = Stat.find_by(season_id: season_id, player_id: assist_player_id)
      stat.update(elo: Stat::K_ELO * 2 + stat.elo) if stat
    end
    puts :goal_rate_end
  end
end
