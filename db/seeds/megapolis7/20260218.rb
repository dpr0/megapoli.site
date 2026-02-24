# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '18.02.2026'.to_date)
  day.add_players(
    1 => [18, 54, 13, 60, 62, 44],  # Морозов Тарасов Араз Ярошевич Костенко Валерий
    2 => [93, 19, 105, 3, 24, 100], # Штин Иван Ибра Глобчанский Эльнар Игорь
    3 => [95, 21, 110, 50, 103, 5], # Гуфельд Витвицкий Давид Красочкин Траб Алихан
    4 => [6, 104, 7, 108, 9, 58],   # Тигран Гленн Сандро Арам Федунов Кишинев
    6 => [2, 1, 4, 109, 99, 97],    # Новик Гарик Шах Ахмад Лыков Филимонов
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 18 6')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 54,1 13')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 4, team_right_id: 6).add_goals(z, '4 104 6')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '3 95 50')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 93 100')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '2 105 100')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 100,6 1 2')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 6 58,4 6 104')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 18 60')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 18 54')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '')
  g.create(team_left_id: 4, team_right_id: 1).add_goals(z, '1 13 18,14 7 104')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 54 18')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 18 44')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 54 44')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 13 18,1 54 44')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 6, team_right_id: 3).add_goals(z, '6 109')
  g.create(team_left_id: 6, team_right_id: 2).add_goals(z, '6 109,6 6 2')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

