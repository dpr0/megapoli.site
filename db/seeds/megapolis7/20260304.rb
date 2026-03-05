# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '04.03.2026'.to_date)
  day.add_players(
    1 => [18, 93, 60, 62, 109, 50, 24],
    3 => [48, 1, 105, 95, 21, 7, 5],
    6 => [2, 54, 110, 104, 103, 97, 58],
    7 => [13, 6, 4, 19, 9, 42, 44],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 104,6 104 110')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '7 42 13,7 42,6 110')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 21 7')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 7 1')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 18 109,1 93 18')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 62 109,6 110 104')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 1 105,3 1 7')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 104 110,1 48 95,1 105 48')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 48,1 18,1 18 62')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '7 13 6,1 109,7 13 6')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '6 104 54')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 58 54')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 58 110,1 18,6 58')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '6 110,7 13,7 104 110')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 95,3 1 21')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 48 105,3 95 1')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 19')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 4 6,7 6 4')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 19 6,7 19 4')


  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

