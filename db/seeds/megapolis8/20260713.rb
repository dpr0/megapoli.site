# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '13.07.2026'.to_date)
  day.add_players(
    1 => [18, 95, 5, 50, 99, 14],
    3 => [1, 104, 9, 24, 6, 42, 115],
    7 => [13, 2, 19, 114, 21, 7],
    4 => [29, 4, 54, 109, 97, 58],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 0')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,1 0,4 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 0')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 0,7 0,7 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 0,7 0,7 0')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 0,7 0')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 0,3 0,7 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 0,3 0,3 0')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 0,4 0')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 0,4 0,7 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
