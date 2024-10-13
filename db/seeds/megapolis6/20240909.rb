# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find @season_id
  day = Day.new(season_id: season.id, date: '09.09.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [6, 30, 96, 26, 54],
    2 => [58, 4, 2, 1, 60, 97, 93],
    3 => [21, 17, 48, 42, 44, 95]
  )
  day.save
  g = day.games
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 48 42,3 48')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('3 97,3 48')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 97 48,1 96,3 48 97')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('2 58 97,2 60 58')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('1 0 96')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 96,3 42')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('2 97,2 97 58')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('2 4,2 93 4')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('2 1 2')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 54 30,')
  # g.create(team_left_id: , team_right_id: ).add_goals('')
  # g.create(team_left_id: , team_right_id: ).add_goals('')
  # g.create(team_left_id: , team_right_id: ).add_goals('')
  # g.create(team_left_id: , team_right_id: ).add_goals('')
  # g.create(team_left_id: , team_right_id: ).add_goals('')


  day.day_rates!
  season.update_stats!
  # Day.last.update(videos: '')
end
