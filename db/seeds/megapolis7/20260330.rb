# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '30.03.2026'.to_date)
  day.add_players(
    1 => [18, 12, 19, 95, 103, 24, 5],
    3 => [13, 48, 10, 4, 21, 97, 93],
    4 => [6, 54, 104, 60, 50, 109, 112],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 24')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 18 95,4 6')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '3 93 97,3 13 21')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 48 13,3 48 21,1 18 95')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 13,4 0 104')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 18')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 10 48,1 19 95,1 12 18')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 95 12')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 12 18')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 12 14')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18,1 18 95,3 97')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 103 95,1 95 18')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 6 60,4 0 104')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3 4,3 21 4')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 0,3 13')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '3-4')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 18 12,1 12 103')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18,1 95')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 103 54,1 18,1 24')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 19,1 18')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 0 18,1 12')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 4 48,3 21 50')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
