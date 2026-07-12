# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '29.06.2026'.to_date)
  day.add_players(
    3 => [12, 104, 93, 9, 19, 114, 21],
    1 => [13, 29, 110, 6, 2, 5, 97],
    2 => [18, 4, 10, 105, 58, 14, 44],
    4 => [1, 54, 95, 116, 103, 115, 7],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0,4 0')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 0,2 0,2 0')
  g.create(team_left_id: 2, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 0,3 0,3 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 0,2 0')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 0,2 0')
  g.create(team_left_id: 2, team_right_id: 4).add_goals(z, '4 0')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 0,1 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 4).add_goals(z, '2 0')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0,3 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 0')
  g.create(team_left_id: 4, team_right_id: 2).add_goals(z, '4 0')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '4 0,4 0')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 0')
  g.create(team_left_id: 4, team_right_id: 2).add_goals(z, '4 0')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '1 0,1 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
