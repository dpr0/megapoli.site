# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '11.03.2026'.to_date)
  day.add_players(
    1 => [2, 18, 50, 94, 5, 14, 24],
    2 => [13, 12, 4, 103, 108, 44, 95],
    3 => [48, 54, 93, 9, 7, 42, 112],
    7 => [1, 110, 104, 19, 60, 21, 58],
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 2 94')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 110 21,7 58 21')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 14 94,1 94 14')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18 50,1 94 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 110')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '7 110 58,2 4')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 13 4')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 93 42')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '2 13 103')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 94,1 18 50')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 42 93,3 48 54')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '7 104 110,7 104 19')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 2 18')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 18')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 18 94')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 14 94,1 0 94')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 13 4,2 13 12')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '7 58 110,7 1')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 2 42')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 2 18,1 14 2')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

