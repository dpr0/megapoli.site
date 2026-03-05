# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '25.02.2026'.to_date)
  day.add_players(
    1 => [54, 104, 3, 9, 5, 97],     # Тарасов Гленн Глобчанский Федунов Алихан Филимонов
    2 => [18, 103, 12, 50, 58, 112], # Мороз Траб Кулявцев Красочкин Кишинев Дэниэл
    3 => [13, 6, 110, 42, 109, 102], # Араз Тигран Давид Иванов Ахмад Мин
    6 => [93, 19, 21, 24, 7, 100],   # Штин Кошелапов Витвицкий Эл Сандро Урлин
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 6 110,2 58 103,2 103 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 18 50')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 18,2 50 58')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 13 110,3 42')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 6 13,3 6 110')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 18,2 12 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 104,2 12 58,2 58 18')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 58,2 18 58')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 110,3 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 13')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 21 93,3 42 6')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 54 104,1 3 54')
  g.create(team_left_id: 6, team_right_id: 1).add_goals(z, '1 54 104')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '3 42 13,3 42 13')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '2 103 18,3 42 6')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 54 104')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 54 104,2 18,1 54 104')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 97 54,1 9 104')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 7 19')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '2 58,2 50 58')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 18 12,2 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 58,2 18 50')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '6 93')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 6 13,3 42 13')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

