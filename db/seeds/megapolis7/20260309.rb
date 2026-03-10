# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '09.03.2026'.to_date)
  day.add_players(
    1 => [94, 2, 5, 50, 1],
    2 => [13, 110, 58, 7, 10, 112],
    3 => [48, 93, 42, 108, 21, 105],
    7 => [104, 54, 12, 62, 19, 44],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 1 94,7 104')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 58 104')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 112 58,2 112 58,1 1 2')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 13 7,2 10 112')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 21,3 21 105')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '7 104,2 13')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '1 1,1 1 50')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 2 48')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 13,1 94 2')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 54 62')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 112 110,7 44')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 108 105')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 93 108,2 13')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 62 12')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '7 12 19')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 19 54,7 54 44')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 1 94,1 50 94')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 0 7,1 2')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 93 108,3 105')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 108,2 13,2 58 110')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 54 62,7 62 104')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

