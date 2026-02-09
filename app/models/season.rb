# frozen_string_literal: true

class Season < ApplicationRecord
  include Dictionary

  has_many :days
  has_many :goals
  has_many :day_players
  belongs_to :championship, optional: true

  def self.days_by_season_id(season_id)
    cached_by_id[season_id].days.map(&:id)
  rescue StandardError
  end

  def update_stats!(dps, games)
    dps.each do |dp|
      win1, win2, win3, draw, lose, day_games = Array.new(6, 0)
      stat = StatService.new(dp.team_id, games)
      day_games += stat.day_games
      win3 += stat.win3
      win2 += stat.win2
      win1 += stat.win1
      draw += stat.draw
      lose += stat.lose
      dp.days = dps.size
      dp.games = day_games
      dp.win = win3 + win2 + win1
      dp.draw = draw
      dp.lose = lose
      dp.save
    end
    # Player.where(id: dps.map(&:player_id)).each do |player|
    #   byebug
    #   day_team = player.day_players_by_season(id).map { |dp| [dp.day_id, dp.team_id, dp.elo] }
    #   win1, win2, win3, draw, lose, day_games = Array.new(6, 0)
    #   day_team.each do |day_id, team_id, _|
    #     stat = StatService.new(day_id, team_id)
    #     day_games += stat.day_games
    #     win3 += stat.win3
    #     win2 += stat.win2
    #     win1 += stat.win1
    #     draw += stat.draw
    #     lose += stat.lose
    #   end
    #
    #   player.day_players.where(season_id: id).order(id: :desc).first.update(
    #     days: day_team.count,
    #     games: day_games,
    #     win: win3 + win2 + win1,
    #     draw: draw,
    #     lose: lose
    #   )
    # end
  end
end
