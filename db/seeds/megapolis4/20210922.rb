# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s4d07 = Day.new(season_id: @season_id, date: '22.09.2021'.to_date)

  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id:  2) # коля
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id:  5) # алихан
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id:  6) # тигран
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id:  9) # вова
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id: 54) # тарасов
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id: 52) # черных
  s4d07.day_players.new(season_id: @season_id, team_id: 1, player_id: 38) # миша

  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 4) # шах
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 13) # араз
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 24) # эл
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 58) # рома
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 12) # кулявц
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 7) # сандро
  s4d07.day_players.new(season_id: @season_id, team_id: 2, player_id: 35) # юра

  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 57) # денис
  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 17) # андр
  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 32) # игорь
  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 49) # егор
  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 21) # я
  s4d07.day_players.new(season_id: @season_id, team_id: 3, player_id: 8) # арг
  s4d07.save

  g2864 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g2864.goals.create(team_id: 1, player_id: 38, assist_player_id: 52)
  g2864.goals.create(team_id: 1, player_id: 52, assist_player_id: 2)
  g2865 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g2865.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2865.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g2866 = Game.create(day_id: s4d07.id, team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 3)
  g2866.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g2867 = Game.create(day_id: s4d07.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g2867.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2867.goals.create(team_id: 1, player_id: 52, assist_player_id: nil)
  g2868 = Game.create(day_id: s4d07.id, team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 1)
  g2868.goals.create(team_id: 3, player_id: 17, assist_player_id: nil)
  g2868.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g2868.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g2869 = Game.create(day_id: s4d07.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g2869.goals.create(team_id: 2, player_id: 4, assist_player_id: 58)
  g2869.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g2870 = Game.create(day_id: s4d07.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 3)
  g2870.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g2870.goals.create(team_id: 3, player_id: 57, assist_player_id: 21)
  g2871 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2871.goals.create(team_id: 1, player_id: 52, assist_player_id: nil)
  g2871.goals.create(team_id: 1, player_id: 52, assist_player_id: nil)
  g2871.goals.create(team_id: 3, player_id: 9, assist_player_id: nil)
  g2872 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g2872.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g2872.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g2872.goals.create(team_id: 3, player_id: 8, assist_player_id: nil)
  g2873 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g2873.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g2874 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g2874.goals.create(team_id: 1, player_id: 6, assist_player_id: 2)
  g2874.goals.create(team_id: 3, player_id: 32, assist_player_id: 49)
  g2875 = Game.create(day_id: s4d07.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 3)
  g2875.goals.create(team_id: 3, player_id: 21, assist_player_id: 57)

  g2876 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g2876.goals.create(team_id: 1, player_id: 52, assist_player_id: nil)
  g2877 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g2877.goals.create(team_id: 1, player_id: 2, assist_player_id: 54)
  g2877.goals.create(team_id: 1, player_id: 52, assist_player_id: 2)
  g2878 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g2878.goals.create(team_id: 1, player_id: 54, assist_player_id: nil)
  g2878.goals.create(team_id: 1, player_id: 9, assist_player_id: nil)
  g2879 = Game.create(day_id: s4d07.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 2)
  g2879.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g2879.goals.create(team_id: 2, player_id: 58, assist_player_id: 12)
  g2800 = Game.create(day_id: s4d07.id, team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 2)
  g2800.goals.create(team_id: 3, player_id: 8, assist_player_id: 21)
  g2801 = Game.create(day_id: s4d07.id, team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 1)
  g2801.goals.create(team_id: 3, player_id: 17, assist_player_id: 8)
  g2802 = Game.create(day_id: s4d07.id, team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 2)
  g2802.goals.create(team_id: 3, player_id: 32, assist_player_id: 57)
  g2802.goals.create(team_id: 3, player_id: 32, assist_player_id: 8)

  s4d07.day_rates!
  Day.last.update!(videos: 'GhsfnnEbwHc,IFyI5scBfSg,zKeme3WJEUE,eoxbp-6vEek,6zVHcNoxhlQ,pUHe99G8p6g,GDtm7249gE0,hzMjQTtCIyk,C20-u3LxMjk')
end
