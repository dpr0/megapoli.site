ActiveRecord::Base.transaction do
  s4d24 = Day.new(season_id: @season_id, date: '29.11.2021'.to_date)
                                                                    
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id:  2) # коля
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id:  9) # вова
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id:  5) # алихан
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id: 38) # миша
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id: 29) # макс
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id:  1) # гарик
  s4d24.day_players.new(season_id: @season_id, team_id: 1, player_id: 54) # тарасов

  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id:  4) # шах
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 10) # виталик
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 11) # саша
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 12) # саша
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 13) # араз
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 24) # эл
  s4d24.day_players.new(season_id: @season_id, team_id: 2, player_id: 58) # рома

  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id: 21) # я
  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id: 62) # вова
  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id: 42) # серега
  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id: 48) # макс
  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id:  8) # арг
  s4d24.day_players.new(season_id: @season_id, team_id: 3, player_id: 63) # валер
  s4d24.save

  g2456 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2456.goals.create(team_id: 2, player_id: 13, assist_player_id: nil)
  g2456.goals.create(team_id: 2, player_id: 13, assist_player_id: nil)
  g2456.goals.create(team_id: 3, player_id: 8, assist_player_id: 63)
  g2457 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 1)
  g2457.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g2457.goals.create(team_id: 2, player_id: 13, assist_player_id: nil)
  g2457.goals.create(team_id: 1, player_id: 29, assist_player_id: 1)
  g2458 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 3)
  g2458.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g2458.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g2459 = Game.create(day_id: s4d24.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 3)
  g2459.goals.create(team_id: 3, player_id: 63, assist_player_id: 8)
  g2460 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g2460.goals.create(team_id: 2, player_id: 11, assist_player_id: 10)
  g2460.goals.create(team_id: 2, player_id: 24, assist_player_id: nil)
  g2461 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2461.goals.create(team_id: 1, player_id: 54, assist_player_id: 1)
  g2461.goals.create(team_id: 1, player_id: 38, assist_player_id: 54)
  g2462 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2462.goals.create(team_id: 1, player_id: 54, assist_player_id: nil)
  g2462.goals.create(team_id: 1, player_id: 29, assist_player_id: nil)
  g2463 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g2463.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g2463.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g2464 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 3)
  g2465 = Game.create(day_id: s4d24.id, team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g2466 = Game.create(day_id: s4d24.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g2466.goals.create(team_id: 1, player_id: 1, assist_player_id: 38)
  g2466.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)
  g2467 = Game.create(day_id: s4d24.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 3)
  g2467.goals.create(team_id: 3, player_id: 62, assist_player_id: 8)
  g2468 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2468.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g2468.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g2468.goals.create(team_id: 3, player_id: 8, assist_player_id: nil)

  g2469 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 1)
  g2469.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g2469.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)
  g2469.goals.create(team_id: 1, player_id: 38, assist_player_id: 54)
  g2470 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 1)
  g2470.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)
  g2471 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2471.goals.create(team_id: 1, player_id: 54, assist_player_id: nil)
  g2471.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)
  g2472 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2472.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g2472.goals.create(team_id: 1, player_id: 54, assist_player_id: nil)
  g2473 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 1)
  g2473.goals.create(team_id: 2, player_id: 58, assist_player_id: 13)
  g2474 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2474.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g2474.goals.create(team_id: 2, player_id: 4, assist_player_id: 12)
  g2474.goals.create(team_id: 3, player_id: 8, assist_player_id: 21)
  g2475 = Game.create(day_id: s4d24.id, team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 1)
  g2476 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 1)
  g2477 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 2)
  g2477.goals.create(team_id: 3, player_id: 8, assist_player_id: nil)
  g2479 = Game.create(day_id: s4d24.id, team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 1)
  g2479.goals.create(team_id: 3, player_id: 8, assist_player_id: nil)
  g2479.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)

  s4d24.day_rates!
  Day.last.update!(videos: 'SbCNDnQ-r3k,sKHqHvy3Rd8,IX_RXwED7Mc,AZUzRYzyuuc,gezqXxVXZPc,14r7jAinWmI,_mTdYDaYd4Y,fXfTYcbUv0E,NuVw9zL6lrY')
end
