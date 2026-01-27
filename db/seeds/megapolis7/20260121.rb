# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.last
  day = Day.create(season_id: season.id, date: '21.01.2026'.to_date)
  day.add_players(
    1 => [2, 5, 6, 9, 18, 29],
    2 => [4, 13, 54, 99, 58],
    3 => [21, 48, 3, 93, 95],
    6 => [44, 100, 101, 102, 103],
  )
  g = day.games
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 21 48')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('3 95 48,3 95 93')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 48 95')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('2 4')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('2 4,2 4 54')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 95,2 4 13,3 95 3')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 48 95,3 3')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('3 0 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 21 93,2 4 58')
  g.create(team_left_id: 1, team_right_id: 6).add_goals('1 18,1 6 9')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('3 93 95,3 48')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('2 4 13')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 9 2,2 4 54,1 18 29')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 9 18,1 0 2')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('1 29 2,1 18 6')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 6 2,1 6 29')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 6 2,1 18 2')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 95 48,1 29 6,1 2 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 6 2,1 2 6')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 18 6,1 18 6')

  day.day_rates!
  season.update_stats!
end
