# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '03.06.2026'.to_date)
  day.add_players(
    1 => [54, 95, 110, 19, 116, 60, 109],
    3 => [18, 21, 58, 93, 5, 99, 50],
    4 => [1, 4, 6, 24, 3, 7, 104],
    7 => [13, 2, 42, 26, 112, 113, 106],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 13 113,3 93 18')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 60 116,7 110')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '7 110 95,1 13 113')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 104')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '1 104,4 112')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 58 18,3 18')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 42 13,3 50')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 95 109,4 6 3')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 42,1 42 13')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '4 4,1 13 2,4 6 104')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 6 4')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 42')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 95 110,7 19 110')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3:7,3 18')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 58,3 18 58')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 18,3 18')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 19 54,7 19 110')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 13,1 42 113')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 6 1')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 1')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 3')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 4,4 1')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 0,4 0')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
