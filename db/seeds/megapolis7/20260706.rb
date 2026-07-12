# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '06.07.2026'.to_date)
  day.add_players(
    1 => [13, 29, 2, 94, 109, 5, 115],
    3 => [1, 54, 9, 62, 58, 106, 42],
    6 => [4, 95, 110, 19, 104, 116, 44],
    7 => [18, 24, 6, 21, 50, 7, 14],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 0,7 0')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '7 0,7 0,6 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 0')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 0')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '7 0,6 0,6 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 0,6 0')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 0,6 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
