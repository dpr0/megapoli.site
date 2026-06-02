# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '29.04.2026'.to_date)
  day.add_players(
    1 => [12, 42, 95, 21, 5, 7],
    2 => [54, 6, 105, 9, 60, 14],
    3 => [19, 93, 97, 24, 58, 108],
    6 => [13, 29, 110, 103, 115, 106],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '6 110')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '2 6 54,6 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 6 54')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 42,1 21 95')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 106 110')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 54 6,6 106 13,6 106 13')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 110 106,6 13 29')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 110 106')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 9,6 29 103,2 6 54')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 19 93')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '3 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 19 93,2 9')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 103,1 42')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 93 19,3 58')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 7 21,1 12 42')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 106')
  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
