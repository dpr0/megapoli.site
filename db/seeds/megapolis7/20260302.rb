# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '02.03.2026'.to_date)
  day.add_players(
    1 => [18, 7, 5, 44, 21, 109],         #
    3 => [93, 110, 30, 62, 42, 105, 104], # Давид Рябов Костенко ибра глен
    6 => [54, 1, 95, 14, 58, 13, 108],    # арам
    7 => [48, 6, 19, 10, 50, 103, 112],   # Траб Дэниэл
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]

  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 42 93')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 14 108,3 93 104,3 104  42')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 7')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 18')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 109 44,1 21 7')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 93,1 18')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 103 48,7 48 10')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 62 42')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 1 95,6 1')
  g.create(team_left_id: 7, team_right_id: 6).add_goals(z, '6 13 95,7 48')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '6 95 54,7 10 6')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18 44')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 0')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 7 13,3 104 93,3 93 42')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 58')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '6 54,7 10 6')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 109 44,3 110')
  g.create(team_left_id: 6, team_right_id: 7).add_goals(z, '7 103 50')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

