# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '16.02.2026'.to_date)
  day.add_players(
    1 => [93, 54, 13, 60, 62, 5, 14],
    2 => [95, 2, 105, 7, 10, 102, 109],
    3 => [6, 21, 104, 12, 42, 97, 108],
    6 => [1, 19, 4, 50, 24, 103, 58],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 21 6,2 102 95')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 93')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 54 5,3 6 104')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 6 104')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 1 50,6 1 103')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 4 1')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 42 21,3 108')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 13 93,1 60 13')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 105')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 102 105,6 19,6 103')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 21 12,3 104 21')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 13 93')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 54 93')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '1 93')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 104,3 104 6')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 97,2 10,3 42 97')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '6 58 19')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 1')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 10,2 95')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 6 108,2 2 95,2 95 2')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 105')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 105 7')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

