# frozen_string_literal: true

ActiveRecord::Base.transaction do
  # day = Day.new(season_id: @season_id, date: 'dd.mm.2024'.to_date)
  # day.videos = ''
  # [
  #   {team_id: , player_id: },
  #   {team_id: , player_id: },
  #   {team_id: , player_id: },
  #   {team_id: , player_id: },
  #   {team_id: , player_id: },
  # ].each { |attrs| day.day_players.new(attrs.merge(season_id: day.season_id)) }
  # day.save
  #
  # g = day:.games.create(season_id: @season_id, team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  # g = day:.games.create(season_id: @season_id, team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  # g = day:.games.create(season_id: @season_id, team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  # g = day:.games.create(season_id: @season_id, team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  # g = day:.games.create(season_id: @season_id, team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  #
  # day.day_rates!
end
# Player.update_stats!(season_id)
# Day.last.update(videos: '')