# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '11.02.2026'.to_date)
  day.add_players(
    1 => [13, 105, 42, 99, 5, 100],
    2 => [48, 54, 50, 62, 9, 58],
    3 => [6, 2, 104, 7, 24],
    6 => [93, 95, 21, 4, 12, 103],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 100 42')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 21')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 95 93,6 103 95')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 58 62')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '2 58,2 48 50')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 6 48')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 93 103')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 12 95,6 12 95')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 6 104,3 6 24')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 2 104,3 6 2')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 104,2 54 9,3 6 4')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 21 4,6 93 4')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 103 4,6 95 4')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 95 21')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 104,3 6 104')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 100 42,3 7 6,3 7 2')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 6 104')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
