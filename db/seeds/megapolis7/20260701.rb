# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '01.07.2026'.to_date)
  day.add_players(
    4 => [1, 54, 6, 97, 115, 7, 117],
    3 => [4, 95, 9, 110, 2, 94, 21],
    6 => [18, 29, 19, 109, 58, 44, 50],
    1 => [13, 104, 42, 5, 106, 99],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,4 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 0')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 0,6 0,3 0')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '6 0,4 0,4 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0')
  g.create(team_left_id: 4, team_right_id: 6).add_goals(z, '4 0,6 0,6 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,4 0,4 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 0,6 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 4, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 0')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 0,3 0,1 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,3 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
