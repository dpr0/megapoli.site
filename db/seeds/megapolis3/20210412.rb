# frozen_string_literal: true

s3d28 = Day.new(season_id: @season_id, date: '12.04.2021'.to_date)

s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 2) # коля
s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 18) # дима
s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 5) # адихан
s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 38) # миша
s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 6) # тигран
s3d28.day_players.new(season_id: @season_id, team_id: 1, player_id: 23) # сереега

s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 4) # шах
s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 12) # саня
s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 45) # санин
s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 10) # виталик
s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 11) # саня
s3d28.day_players.new(season_id: @season_id, team_id: 2, player_id: 7) # сандро

s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id: 21) # дима
s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id: 22) # илья
s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id: 54) # тарасов
s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id: 14) # саша
s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id: 57) # денис
s3d28.day_players.new(season_id: @season_id, team_id: 3, player_id:  8) # арг

s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id:  3) # ден
s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id: 32) # игорь
s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id:  9) # вова
s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id:  1) # гарик
s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id: 13) # араз
s3d28.day_players.new(season_id: @season_id, team_id: 4, player_id: 53) # аслан
s3d28.save

g2224 = Game.create(day_id: s3d28.id, team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 2)
g2224.goals.create(team_id: 4, player_id: 1, assist_player_id: nil)
g2224.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
g2225 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
g2225.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
g2225.goals.create(team_id: 3, player_id: 8, assist_player_id: 54)
g2226 = Game.create(day_id: s3d28.id, team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 2)
g2226.goals.create(team_id: 2, player_id: 4, assist_player_id: 11)
g2227 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 2)
g2227.goals.create(team_id: 2, player_id: 4, assist_player_id: 12)
g2228 = Game.create(day_id: s3d28.id, team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 2)
g2228.goals.create(team_id: 3, player_id: 22, assist_player_id: 8)
g2229 = Game.create(day_id: s3d28.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 4)
g2229.goals.create(team_id: 4, player_id: nil, assist_player_id: 32)
g2229.goals.create(team_id: 4, player_id: 32, assist_player_id: nil)
g2230 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 4)
g2230.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2230.goals.create(team_id: 1, player_id: 38, assist_player_id: 18)
g2230.goals.create(team_id: 4, player_id: 13, assist_player_id: nil)
g2231 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
g2231.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2231.goals.create(team_id: 2, player_id: 12, assist_player_id: nil)
g2231.goals.create(team_id: 2, player_id: 12, assist_player_id: 7)
g2232 = Game.create(day_id: s3d28.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 2)
g2232.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
g2232.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
g2233 = Game.create(day_id: s3d28.id, team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 2)
g2233.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
g2234 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
g2234.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2234.goals.create(team_id: 1, player_id: 18, assist_player_id: 38)
g2235 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
g2235.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2235.goals.create(team_id: 1, player_id: 23, assist_player_id: 18)
g2235.goals.create(team_id: 3, player_id: 14, assist_player_id: 21)

g2236 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 4)
g2237 = Game.create(day_id: s3d28.id, team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 3)
g2237.goals.create(team_id: 2, player_id: 11, assist_player_id: 10)
g2238 = Game.create(day_id: s3d28.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 4)
g2238.goals.create(team_id: 2, player_id: 4, assist_player_id: 12)
g2238.goals.create(team_id: 4, player_id: 9, assist_player_id: nil)
g2239 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
g2239.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
g2239.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2240 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 4)
g2240.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
g2240.goals.create(team_id: 1, player_id: 18, assist_player_id: 38)
g2240.goals.create(team_id: 4, player_id: 13, assist_player_id: 1)
g2241 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
g2241.goals.create(team_id: 1, player_id: 18, assist_player_id: 38)
g2241.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
g2241.goals.create(team_id: 2, player_id: 10, assist_player_id: nil)
g2242 = Game.create(day_id: s3d28.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 2)
g2242.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
g2242.goals.create(team_id: 2, player_id: 10, assist_player_id: 11)
g2243 = Game.create(day_id: s3d28.id, team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 4)
g2243.goals.create(team_id: 4, player_id: 1, assist_player_id: 9)
g2243.goals.create(team_id: 4, player_id: 3, assist_player_id: 9)
g2243.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)
g2244 = Game.create(day_id: s3d28.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 4)
g2244.goals.create(team_id: 1, player_id: 23, assist_player_id: nil)
g2244.goals.create(team_id: 1, player_id: 2, assist_player_id: 38)
g2245 = Game.create(day_id: s3d28.id, team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 1)
g2245.goals.create(team_id: 3, player_id: 8, assist_player_id: nil)
g2245.goals.create(team_id: 1, player_id: 2, assist_player_id: 38)
g2246 = Game.create(day_id: s3d28.id, team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 2)
g2246.goals.create(team_id: 4, player_id: 13, assist_player_id: nil)
g2247 = Game.create(day_id: s3d28.id, team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 3)
g2247.goals.create(team_id: 4, player_id: 14, assist_player_id: nil)
g2247.goals.create(team_id: 4, player_id: 3, assist_player_id: nil)

s3d28.day_rates!
Day.last.update!(videos: 'd5Uh-9afxto,Fk9_4M-nZ4o,AZqUo1XBVPk,p4PmabJR_wc,zQVLXm9DaQE,Mm2FIpoHjGI,qgmfeXhPZYI,QBYsx0BX5Dg,2unYJ8M_eeE')
