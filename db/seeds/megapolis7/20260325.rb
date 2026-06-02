# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '25.03.2026'.to_date)
  day.add_players(
    1 => [2, 54, 104, 94, 21, 29],
    # - Новик Николай (1012)
    # - Тарасов Александр (827)
    # - Гленн Нчуту (739)
    # - Камышик Максим (663)
    # - Новик Платон (676)
    # - Витвицкий Дмитрий (597)

    3 => [19, 6, 60, 62, 24, 42, 93],
    # - Саргсян Тигран (924)
    # - Кошелапов Иван (806)
    # - Штин Сергей (755)
    # - Костенко Владимир (655)
    # - Ярошевич Алексей (654)
    # - Иванов Сергей (643)
    # - Абулов Эльнар (595)

    4 => [1, 48, 95, 9, 109, 50, 44],
    # - Солоян Гарик (946)
    # - Воржев Максим (930)
    # - Гуфельд Кирилл (672)
    # - Федунов Владимир (683)
    # - Красочкин Михаил (648)
    # - Ахмад Коло (589)
    # - Белых Валерий (467)

    7 => [18, 13, 4, 7, 14, 112],
    # - Морозов Дмитрий (1544)
    # - Эйвазов Араз (972)
    # - Абулов Шахин (782)
    # - Никурадзе Сандро (555)
    # - Порошкин Александр (469)
    # - Аканду Дэниэл (460)
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 13 18')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '7 18 13,4 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 1,1 29')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '4 1,1 54 94,4 50')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 54 104')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 54,1 29')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 4 18')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '4 1 48')
  g.create(team_left_id: 4, team_right_id: 3).add_goals(z, '4 9')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 0 4,7 18 7')
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '1 21 5')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '')
  g.create(team_left_id: 3, team_right_id: 4).add_goals(z, '4 48,4 1 50')
  g.create(team_left_id: 7, team_right_id: 4).add_goals(z, '4 1')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 94 54,1 104')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 54 104,1 104 5')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 0 29')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 104 94,3 42 29,1 104 54')
  g.create(team_left_id: 1, team_right_id: 4).add_goals(z, '1 104,4 48 50,4 1 48')
  g.create(team_left_id: 4, team_right_id: 7).add_goals(z, '4 1,7 18 13,7 13 18')
  g.create(team_left_id: 3, team_right_id: 7).add_goals(z, '3 4 62')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 42')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
