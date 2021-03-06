# frozen_string_literal: true

s2d5 = Day.new(season_id: @season_id, date: '03.08.2020'.to_date)
s2d5t1p1 = s2d5.day_players.new(season_id: @season_id, team_id: 1, player_id: 23) # врач
s2d5t1p2 = s2d5.day_players.new(season_id: @season_id, team_id: 1, player_id: 5) # алихан
s2d5t1p3 = s2d5.day_players.new(season_id: @season_id, team_id: 1, player_id: 18) # дима
s2d5t1p4 = s2d5.day_players.new(season_id: @season_id, team_id: 1, player_id: 2) # коля
s2d5t1p5 = s2d5.day_players.new(season_id: @season_id, team_id: 1, player_id: 33) # макс а

s2d5t2p1 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id: 41) # мага
s2d5t2p2 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id: 13) # араз
s2d5t2p3 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id:  3) # ден
s2d5t2p4 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id: 12) # саня
s2d5t2p5 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id: 7) # сандро
s2d5t2p5 = s2d5.day_players.new(season_id: @season_id, team_id: 2, player_id: 10) # виталик

s2d5t3p1 = s2d5.day_players.new(season_id: @season_id, team_id: 3, player_id: 17) # андр
s2d5t3p1 = s2d5.day_players.new(season_id: @season_id, team_id: 3, player_id: 28) # евр
s2d5t3p2 = s2d5.day_players.new(season_id: @season_id, team_id: 3, player_id: 42) # сергей
s2d5t3p2 = s2d5.day_players.new(season_id: @season_id, team_id: 3, player_id:  8) # аргентина
s2d5t3p2 = s2d5.day_players.new(season_id: @season_id, team_id: 3, player_id:  8) # валера

s2d5t4p1 = s2d5.day_players.new(season_id: @season_id, team_id: 4, player_id:  9) # вова
s2d5t4p2 = s2d5.day_players.new(season_id: @season_id, team_id: 4, player_id: 47) # анк
s2d5t4p3 = s2d5.day_players.new(season_id: @season_id, team_id: 4, player_id: 14) # саша
s2d5.save

g01 = Game.create(day_id: s2d5.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
g01.goals.create(team_id: 1, player_id: 2)
g02 = Game.create(day_id: s2d5.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 4)
g02.goals.create(team_id: 1, player_id: 33)
g02.goals.create(team_id: 4, player_id: 7)
g03 = Game.create(day_id: s2d5.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 3)
g03.goals.create(team_id: 3, player_id: 44)
g04 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 3)
g04.goals.create(team_id: 4, player_id: 47)
g05 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 1)
g05.goals.create(team_id: 1, player_id: 33)
g05.goals.create(team_id: 1, player_id: 2)
g06 = Game.create(day_id: s2d5.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
g06.goals.create(team_id: 1, player_id: 33)
g07 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 1)
g08 = Game.create(day_id: s2d5.id, team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 4)
g09 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 1)
g09.goals.create(team_id: 1, player_id: 14)
g10 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 1)
g10.goals.create(team_id: 4, player_id: 12)
g11 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 2)
g11.goals.create(team_id: 2, player_id: 13)
g11.goals.create(team_id: 2, player_id: 12)
g12 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 2)
g12.goals.create(team_id: 2, player_id: 13)

g13 = Game.create(day_id: s2d5.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 2)
g13.goals.create(team_id: 2, player_id: 7)
g14 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 2)
g14.goals.create(team_id: 2, player_id: 13)
g15 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)
g16 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 1)
g16.goals.create(team_id: 1, player_id: 2)
g16.goals.create(team_id: 1, player_id: 14)
g17 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 1)
g17.goals.create(team_id: 3, player_id: 42)
g17.goals.create(team_id: 1, player_id: 2)
g18 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 0, team_right_id: 2)
g19 = Game.create(day_id: s2d5.id, team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 1)
g19.goals.create(team_id: 3, player_id: 28)
g19.goals.create(team_id: 1, player_id: 14)
g20 = Game.create(day_id: s2d5.id, team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 2)
g20.goals.create(team_id: 2, player_id: 7)

s2d5.day_rates!
