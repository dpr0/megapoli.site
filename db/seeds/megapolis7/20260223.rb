# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '23.02.2026'.to_date)
  day.add_players(
    1 => [2, 13, 105, 110, 9, 103, 44], # Новик - Араз - Султан - Давид - Федунов - Траб - Валерий
    2 => [1, 54, 4, 12, 24, 97, 100],   # Гарик - Тарасов - Шах - Кулявцев - Эл - Филимонов - Урлин
    3 => [93, 104, 19, 108, 3, 5, 58],  # Штин - Гленн - Иван - Арам - Глобчанский - Алихан - Роман
    6 => [6, 95, 7, 109, 50, 14, 102],  # Тигран - Кирилл - Сандро - Ахмад - Михаил - Порошкин - Мин
  )
  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 24 1,2 100 1')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 93 19')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 93,1 110 2')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 1 97,2 1')
  g.create(team_left_id: 2, team_right_id: 1).add_goals(z, '1 2 13,2 1 12,2 1')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 58 104,3 58 93')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 58 93')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 110 13')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '6 95 6,6 6')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 1')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 93 104,2 1 24')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 110,1 13 110')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '3 104,3 104 108')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '2 12 54,2 54 4')
  g.create(team_left_id: 2, team_right_id: 6).add_goals(z, '2 100,6 0')
  g.create(team_left_id: 1, team_right_id: 3).add_goals(z, '1 13 110')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 105 2,1 103 44')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '2 1,2 4')
  g.create(team_left_id: 2, team_right_id: 3).add_goals(z, '3 58,3 58,2 54 1')
  g.create(team_left_id: 3, team_right_id: 6).add_goals(z, '3 93 58')
  g.create(team_left_id: 3, team_right_id: 1).add_goals(z, '1 110')
  g.create(team_left_id: 1, team_right_id: 2).add_goals(z, '1 2,1 110')
  g.create(team_left_id: 1, team_right_id: 6).add_goals(z, '1 110')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end

