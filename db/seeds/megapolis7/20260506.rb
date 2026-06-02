# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '06.05.2026'.to_date)
  day.add_players(
    1 => [13, 29, 4, 95, 5, 58],
    3 => [19, 110, 93, 104, 111, 97, 109],
    6 => [1, 2, 115, 103, 21, 50],
    7 => [18, 54, 24, 106, 112, 14],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 2 4,6 2')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 93')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 4 5')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 13,1 4 95')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 106,7 18')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 104')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 19 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 104,3 104')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 54 18,7 14')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 29')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 29 13,1 13 58')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 54')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 106')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 18,1 29,1 95')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 58,3 111')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 14 18,7 29 18')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 18 106')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 95 13')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 29,1 13')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 93 104')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 106 14,7 14')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
