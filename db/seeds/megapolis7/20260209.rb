# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '09.02.2026'.to_date)
  day.add_players(
    1 => [48, 6, 50, 5, 10, 44],
    2 => [2, 13, 105, 12, 58, 107],
    3 => [4, 95, 104, 21, 24, 102],
    6 => [18, 93, 54, 7, 9, 14],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 95 104')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 6 48')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 54 93,1 50 48')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 4 21,2 107 13')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0 93')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 54 18,6 54 18,3 95 104')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '2 13 12')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 54,6 54 9')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '6 93,6 54 18')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '6 54 18,6 18 54')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '3 21 104,6 14 9,6 93 18')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 21 104')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 6 48')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 104,2 2 12')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '9 93')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 93 54')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 14 18,3 21 104')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
