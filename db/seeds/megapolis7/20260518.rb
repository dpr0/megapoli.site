# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '18.05.2026'.to_date)
  day.add_players(
    1 => [13, 2, 104, 94, 5, 109],
    3 => [19, 93, 110, 6, 29, 58, 60],
    4 => [54, 4, 95, 10, 112, 21, 44],
    7 => [18, 62, 50, 115, 14, 7],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 13,4 54')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 14 50,7 18')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 95,4 95 54')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 62 50,7 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 104 94,1 94 13')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 104 13,1 2 94')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 104,1 104 2')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 2 94,1 104 2')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 54')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 4 62,3 29')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 6 19,3 6 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 58,3 58')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '1 110 58,1 0 110')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 58 60')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 95 54,7 18,7 50')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 0')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 18,7 115 50')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 6 29')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 21 54,4 95 54')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 95 54')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 21 44,4 95 54')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 29 110')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 50 14,7 7 14')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
