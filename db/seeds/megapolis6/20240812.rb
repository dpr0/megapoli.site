# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find @season_id
  day = Day.new(season_id: season.id, date: '12.08.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [26, 6, 5, 29, 9, 96, 97],
    2 => [13, 2, 4, 10, 58, 14, 60],
    3 => [21, 30, 17, 54, 48, 44, 95]
  )
  day.save

  day.games.create(team_left_id: 3, team_right_id: 2).add_goals '3 21 48,2 60 2,3 48 54'
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '3 21 95,3 48 30'
  day.games.create(team_left_id: 3, team_right_id: 2).add_goals '3 95 30'
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '1 96 6'
  day.games.create(team_left_id: 2, team_right_id: 1).add_goals '2 58 4,2 4 2'
  day.games.create(team_left_id: 2, team_right_id: 3).add_goals '2 2,3 17 48'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '1 26 29,1 96 6'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 6 29'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '3 48 95,1 6 96,1 96 6'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 9 6,1 96 6'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '3 48 95,1 97 96,1 26 29'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 6 96,2 4 58'
  day.games.create(team_left_id: 3, team_right_id: 2).add_goals '3 30 48,3 48 30,2 14 10'
  day.games.create(team_left_id: 3, team_right_id: 1).add_goals '3 21 3'
  day.games.create(team_left_id: 3, team_right_id: 2)
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '1 96 29,1 29 96'
  day.games.create(team_left_id: 1, team_right_id: 3).add_goals '3 17 48,1 26 96,1 26'
  day.games.create(team_left_id: 1, team_right_id: 2).add_goals '2 60 4,2 60 2'
  day.games.create(team_left_id: 3, team_right_id: 2).add_goals '2 4 21'

  day.day_rates!
  # season.update_stats!
  # Day.last.update(videos: '')
end


