ActiveRecord::Base.transaction do
  s4d22 = Day.new(season_id: @season_id, date: '22.11.2021'.to_date)
                                                                    
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id:  2) # коля
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id:  5) # алихан
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id:  6) # тигран
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id: 29) # макс
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id: 38) # миша
  s4d22.day_players.new(season_id: @season_id, team_id: 1, player_id: 27) # свят

  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id:  4) # шах
  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id: 13) # араз
  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id: 24) # эл
  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id: 10) # виталик
  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id: 11) # саша
  s4d22.day_players.new(season_id: @season_id, team_id: 2, player_id: 12) # саша

  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 48) # макс
  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 61) # коля
  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 17) # андр
  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 57) # денис
  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 42) # серега
  s4d22.day_players.new(season_id: @season_id, team_id: 3, player_id: 21) # я

  s4d22.day_players.new(season_id: @season_id, team_id: 4, player_id:  1) # гарик
  s4d22.day_players.new(season_id: @season_id, team_id: 4, player_id: 54) # тарасов
  s4d22.day_players.new(season_id: @season_id, team_id: 4, player_id: 58) # рома
  s4d22.day_players.new(season_id: @season_id, team_id: 4, player_id:  9) # вова
  s4d22.day_players.new(season_id: @season_id, team_id: 4, player_id: 14) # саша
  s4d22.save

  g2433 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2433.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g2433.goals.create(team_id: 2, player_id: 13, assist_player_id: nil)
  g2433.goals.create(team_id: 3, player_id: 17, assist_player_id: 57)
  g2434 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g2434.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g2434.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2435 = Game.create(day_id: s4d22.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 4)
  g2435.goals.create(team_id: 4, player_id: 54, assist_player_id: nil)
  g2435.goals.create(team_id: 4, player_id: 4, assist_player_id: nil)
  g2436 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g2436.goals.create(team_id: 1, player_id: 38, assist_player_id: 5)
  g2436.goals.create(team_id: 1, player_id: 29, assist_player_id: 6)
  g2437 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g2437.goals.create(team_id: 1, player_id: 29, assist_player_id: 27)
  g2438 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g2439 = Game.create(day_id: s4d22.id, team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 2)
  g2439.goals.create(team_id: 4, player_id: 1, assist_player_id: nil)
  g2439.goals.create(team_id: 2, player_id: 13, assist_player_id: 4)
  g2440 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g2441 = Game.create(day_id: s4d22.id, team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 2)
  g2441.goals.create(team_id: 4, player_id: 1, assist_player_id: nil)
  g2441.goals.create(team_id: 4, player_id: 54, assist_player_id: 9)
  g2442 = Game.create(day_id: s4d22.id, team_left_id: 4, goals_left: 1, goals_right: 2, team_right_id: 3)
  g2442.goals.create(team_id: 4, player_id: 14, assist_player_id: 6)
  g2442.goals.create(team_id: 3, player_id: 2, assist_player_id: nil)
  g2442.goals.create(team_id: 3, player_id: 18, assist_player_id: 29)
  g2443 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g2443.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g2443.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g2444 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 4)
  g2444.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g2445 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
  g2445.goals.create(team_id: 1, player_id: 27, assist_player_id: nil)
  g2446 = Game.create(day_id: s4d22.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2446.goals.create(team_id: 1, player_id: 38, assist_player_id: 27)
  g2446.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2447 = Game.create(day_id: s4d22.id, team_left_id: 4, goals_left: 0, goals_right: 0, team_right_id: 1)

  g2448 = Game.create(day_id: s4d22.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)
  g2449 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g2449.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2450 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 2)
  g2451 = Game.create(day_id: s4d22.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 4)
  g2451.goals.create(team_id: 4, player_id: 6, assist_player_id: nil)
  g2451.goals.create(team_id: 4, player_id: 6, assist_player_id: nil)
  g2452 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 4)
  g2452.goals.create(team_id: 2, player_id: 24, assist_player_id: nil)
  g2452.goals.create(team_id: 2, player_id: 4, assist_player_id: 11)
  g2453 = Game.create(day_id: s4d22.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
  g2453.goals.create(team_id: 1, player_id: 27, assist_player_id: nil)
  g2454 = Game.create(day_id: s4d22.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2454.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g2454.goals.create(team_id: 1, player_id: 27, assist_player_id: nil)
  g2455 = Game.create(day_id: s4d22.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g2455.goals.create(team_id: 1, player_id: 27, assist_player_id: nil)

  s4d22.day_rates!
  Day.last.update!(videos: 'St0R6ZY-Tpw,nWHQG6xpjE4,VcGpMPrkJuU,F0jr5mC_QZw,6hGyVJJcDXc,v8QaqQ3H1Zk,RIwhJRIPsEY,8EWD7zEwVYU,PQZPHpmgX2Q')
end
