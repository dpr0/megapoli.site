# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '23.03.2026'.to_date)
  day.add_players(
    1 => [2,4,50,5,58,108],
    # Новик Николай (1002)
    # Абулов Шахин (743)
    # Красочкин Михаил (648)
    # Абдулаев Алихан (594)
    # Кишинев Роман (532)
    # Саргсян Арам (576)
    2 => [1,42,60,10,112,9],
    # Солоян Гарик (946)
    # Иванов Сергей (683)
    # Ярошевич Алексей (654)
    # Притулин Виталий (605)
    # Даниель (526)
    # Федунов Владимир (537)
    3 => [6,93,104,12,54,44],
    # Саргсян Тигран (914)
    # Штин Сергей (845)
    # Гленн Нчуту (839)
    # Кулявцев Александр (799)
    # Тарасов Александр (703)
    # Белых Валерий (513)
    7 => [13,110,19,7,14,24],
    # Эйвазов Араз (912)
    # Саргсян Давид (716)
    # Кошелапов Иван (796)
    # Никурадзе Сандро (555)
    # Порошкин Александр (469)
    # Абулов Эльнар (595)
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 7, team_right_id: 1).add_goals(z, '7 19 110')
  g.create(team_left_id: 7, team_right_id: 2).add_goals(z, '7 13 19,2 60')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 7, team_right_id: 2).add_goals(z, '7 110')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 60,2 42 1')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '2 42 10,2 1 42')
  g.create(team_left_id: 7, team_right_id: 2).add_goals(z, '2 1,2 42 60')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 42 10,2 1')
  g.create(team_left_id: 3, team_right_id: 2).add_goals(z, '3 6 54,2 42')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '7 110')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '7 7,7 110,1 4')
  g.create(team_left_id: 2, team_right_id: 7).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 104 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 7).add_goals(z, '1 4 50,1 108 4')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 104 6,3 104 12')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 1,3 93,3 93')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 54 6,3 54 6')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 104 108,3 93')
  g.create(team_left_id: 7, team_right_id: 3).add_goals(z, '3 104 6,3 6 104')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 104 93,2 10 42,2 7 93')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
