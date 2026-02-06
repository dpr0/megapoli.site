# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.last
  day = Day.create(season_id: season.id, date: '02.02.2026'.to_date)
  day.add_players(
    1 => [1, 95, 6, 21, 9, 14, 106],
    2 => [4, 42, 19, 50, 10, 58, 44],
    3 => [29, 101, 104, 5, 7, 102, 24],
    6 => [48, 13, 105, 93, 62, 103, 107],
  )
  g = day.games
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 6 1,2 42 50')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('6 103 93')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('6 48 105,6 48 13')
  g.create(team_left_id: 6, team_right_id: 2).add_goals('6 13 93,6 93 62')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 102 104')

  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 101 102,3 1 95,1 29 101')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('2 4 42')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 101 102,1 101 104')
  g.create(team_left_id: 1, team_right_id: 6).add_goals('6 62 48')

  g.create(team_left_id: 6, team_right_id: 2).add_goals('6 48,6 107 48')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('6 48 105')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 101')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('1 101 7')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 1 6')

  g.create(team_left_id: 3, team_right_id: 6).add_goals('6 0')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('6 13,2 58 42')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 1,3 1')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('6 0')
  g.create(team_left_id: 6, team_right_id: 2).add_goals('6 107 48')

  g.create(team_left_id: 6, team_right_id: 1).add_goals('6 107 48')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('6 48 93,6 103 13')

  day.day_rates!
  season.update_stats!
end
