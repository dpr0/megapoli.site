# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '01.06.2026'.to_date)
  day.add_players(
    3 => [54, 4, 6, 105, 115, 58, 50],
    4 => [1, 116, 10, 62, 106, 112, 109],
    6 => [13, 93, 104, 5, 42, 60, 9],
    7 => [12, 2, 19, 26, 21, 7, 44],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '7 2 21,6 42')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 109 116')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '4 116 109,6 42')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 54 4')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 104 42,6 62 93')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '4 106 1,6 13 9,6 13')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '6 13 42,6 42 13')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 42 93,6 13')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '4 62 112,4 1 62')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 104 93')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '6 9')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '4 1 10,4 1 112')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 1,4 1 109')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '4 109 62')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 4,3 6')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
