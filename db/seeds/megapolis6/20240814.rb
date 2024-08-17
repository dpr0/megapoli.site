# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find @season_id
  day = Day.new(season_id: season.id, date: '14.08.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [6, 5, 18, 96, 97],
    2 => [13, 4, 1, 60, 9],
    3 => [21, 17, 54, 44, 95]
  )
  day.save

  day.games.create(team_left_id: 2, team_right_id: 3).add_goals '3 95 44,3 21'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '3 54 17,3 17 21'
  day.games.create(team_left_id: 2, team_right_id: 3).add_goals '2 4,2 1 4'
  day.games.create(team_left_id: 2, team_right_id: 1)
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '1 18 6,1 96 18'
  day.games.create(team_left_id: 2, team_right_id: 1).add_goals '1 96 18,2 4 13,1 97 6'
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '1 18 6,1 18'
  day.games.create(team_left_id: 2, team_right_id: 1).add_goals '1 96 18,2 4 13'
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '1 97 18,1 96 18'
  day.games.create(team_left_id: 2, team_right_id: 1).add_goals '2 1,2 13,1 18'
  day.games.create(team_left_id: 2, team_right_id: 3).add_goals '3 17 21,3 21 54'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '1 96,1 6 18'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 18 96,1 96 18'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '1 96 18,1 96 18'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '2 1 60,2 4 13'
  day.games.create(team_left_id: 3, team_right_id: 2).add_goals '3 95 21,2 4,2 1 4'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '2 13 1,1 18,1 18 96'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '1 18,1 18'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 96 97'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '3 17 21,1 18,1 18 6'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '2 1 60,2 60 1'

  day.day_rates!
  # season.update_stats!
  # Day.last.update(videos: '')
end
