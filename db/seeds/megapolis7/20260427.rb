# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '27.04.2026'.to_date)
  day.add_players(
    3 => [2, 29, 54, 58, 21, 42, 106],
    2 => [12, 6, 10, 105, 62, 50, 7],
    1 => [13, 19, 93, 104, 97, 5],
    6 => [1, 95, 109, 103, 115, 44, 9],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 104 13,1 93 97')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 115')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 42 29,3 54 42,6 1 9')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '6 1 95')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '1 13')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 97,3 42 58')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 58 29,3 106 2')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '2 6 105,2 105')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '2 50')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 104 13')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 13')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 44,1 104')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 105,2 6 50')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 109 95')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 13,1 13')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 13,1 13')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 12 50')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 1')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 58 21')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 42')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 97 104,1 104 13,3 54 29')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
