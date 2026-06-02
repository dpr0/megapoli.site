# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '16.03.2026'.to_date)
  day.add_players(
    1 => [2, 94, 5, 62, 108, 10],
    2 => [18, 4, 50, 14, 9, 24],
    3 => [13, 110, 42, 95, 60, 58],
    4 => [104, 113, 21, 29, 102, 7],
    7 => [1, 12, 97, 112, 93, 19],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 4')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 1')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 42 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0 42,1 2 108,3 42 110')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 95 13,3 95')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 102 113')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 1 97')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 93,7 1 19')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '7 1 112')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 93 12,7 12 93')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 1 19,4 29 21,7 1')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 58 60,2 18 4,2 18')
  g.create(team_left_id: 2, team_right_id: 4).add_goals(z, '2 14 18')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 18 14')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 18,2 50')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 58 42')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 58 110,3 42 58')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 94 108')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 10 2')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 14 18,2 50 18')
  g.create(team_left_id: 2, team_right_id: 4).add_goals(z, '2 18,2 18')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 4')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 18 50')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 108 2')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
