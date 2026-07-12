# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '22.06.2026'.to_date)
  day.add_players(
    6 => [13, 1, 12, 5, 103, 58, 96],
    3 => [18, 4, 19, 21, 50, 109, 115],
    4 => [54, 104, 113, 7, 3, 116, 62],
    1 => [2, 29, 95, 10, 9, 44, 42],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 0')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 0,6 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,1 0,4 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 0,6 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,4 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 6, team_right_id: 4).add_goals(z, '4 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 0,4 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,4 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 0')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '1 0')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '4 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 0,6 0,6 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
