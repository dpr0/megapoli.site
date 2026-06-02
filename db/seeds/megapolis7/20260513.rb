# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '13.05.2026'.to_date)
  day.add_players(
    7 => [18, 24, 114, 97, 115, 60],
    3 => [13, 29, 104, 113, 106, 50],
    1 => [2, 19, 4, 95, 5, 21],
    4 => [1, 54, 9, 58, 7],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '4 4')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 1 7')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 104,4 1')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '7 97 18,7 18 60')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 97 60')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '4 58,4 58')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 54 4,4 1 4')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 2,1 2,4 58')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 2,1 21 19')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 13,3 13,1 2 5')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 1 54')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 97 18,7 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 18,7 18')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 97')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 54 9')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '1 2')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 106,1 2,3 113 13')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 97 18')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '7 114 60')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 114')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 104')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
