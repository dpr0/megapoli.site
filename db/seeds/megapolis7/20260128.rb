# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.last
  day = Day.create(season_id: season.id, date: '28.01.2026'.to_date)
  day.add_players(
    2 => [4, 104, 12, 7, 14, 44, 9],
    3 => [48, 19, 93, 62, 97, 17],
    6 => [13, 6, 101, 105, 103, 3],
    4 => [21, 95, 42, 54, 58, 102],
  )
  g = day.games
  g.create(team_left_id: 2, team_right_id: 6).add_goals('2 105 4')
  g.create(team_left_id: 2, team_right_id: 4).add_goals('')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('')
  g.create(team_left_id: 2, team_right_id: 4).add_goals('4 58 21,4 21 102')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('2 4,2 12')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('6 13 103,2 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('3 48,4 95 21')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('6 103 6,6 6')
  g.create(team_left_id: 4, team_right_id: 6).add_goals('6 6 105,6 13 6')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 48 97')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('')
  g.create(team_left_id: 4, team_right_id: 6).add_goals('6 3 6')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('6 3 101,6 13')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('6 103,6 101 6')
  g.create(team_left_id: 4, team_right_id: 6).add_goals('4 42 95,6 103')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('3 93 48, 3 93 48')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('3 48 93,4 102 42')
  g.create(team_left_id: 2, team_right_id: 6).add_goals('2 104,6 101 6, 6 6 101')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 0')

  day.day_rates!
  season.update_stats!
end
