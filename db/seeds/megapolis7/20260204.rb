# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '04.02.2026'.to_date)
  day.add_players(
    1 => [4, 29, 93, 5, 97, 103],
    2 => [18, 19, 12, 99, 54, 24, 60],
    3 => [21, 101, 13, 50, 7, 102, 106],
    6 => [48, 6, 104, 105, 62, 58, 14],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '1 93 29,1 103 93')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 18 60')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '3 13 21')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 99 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 18 10,1 4 29,2 54 18')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 60 18')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 93 103')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '2 54 18,2 18 54')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 18 54,2 18 19')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 19 18,2 54 18')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 101 106')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 6')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '6 104')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '6 58 48,6 104 48')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 58 6')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '6 54 18')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '2 24 12')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 101 106,3 21 101')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 97,3 106 13,3 101')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
