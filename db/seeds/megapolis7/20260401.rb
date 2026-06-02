# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '01.04.2026'.to_date)
  day.add_players(
    1 => [13, 19, 104, 21, 5, 60, 7],
    2 => [12, 54, 4, 29, 24, 58, 112],
    3 => [18, 6, 93, 97, 108, 50, 44],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 13')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 60 13,1 13')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 21 19,3 18 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 54 4,3 6 18,3 93 108')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 97,3 18 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 6 93,2 29')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 21 19')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 12 4,3 97 108,3 6 108')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 18,3 108')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 54 4,2 4')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 12 58,3 18 50')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 58 4,2 58 54')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 19 60,2 29')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 24,2 29')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 19 60,2 29 54')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 97,3 6')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 6 44,2 4 58,2 58 4')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
