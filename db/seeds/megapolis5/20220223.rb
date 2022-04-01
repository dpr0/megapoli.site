# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s5d13 = Day.new(season_id: @season_id, date: '23.02.2022'.to_date)
  s5d13.day_players.new(season_id: @season_id, team_id: 1, player_id:  2)
  s5d13.day_players.new(season_id: @season_id, team_id: 1, player_id:  5)
  s5d13.day_players.new(season_id: @season_id, team_id: 1, player_id:  6)
  s5d13.day_players.new(season_id: @season_id, team_id: 1, player_id: 14)
  s5d13.day_players.new(season_id: @season_id, team_id: 1, player_id: 38)

  s5d13.day_players.new(season_id: @season_id, team_id: 2, player_id:  7)
  s5d13.day_players.new(season_id: @season_id, team_id: 2, player_id:  4)
  s5d13.day_players.new(season_id: @season_id, team_id: 2, player_id:  9)
  s5d13.day_players.new(season_id: @season_id, team_id: 2, player_id:  1)
  s5d13.day_players.new(season_id: @season_id, team_id: 2, player_id: 23)

  s5d13.day_players.new(season_id: @season_id, team_id: 3, player_id: 21)
  s5d13.day_players.new(season_id: @season_id, team_id: 3, player_id: 61)
  s5d13.day_players.new(season_id: @season_id, team_id: 3, player_id: 44)
  s5d13.day_players.new(season_id: @season_id, team_id: 3, player_id: 57)
  s5d13.day_players.new(season_id: @season_id, team_id: 3, player_id: 35)
  s5d13.save

  g = Game.create(day_id: s5d13.id, team_left_id: 1, goals_left: 2, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 7, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g = Game.create(day_id: s5d13.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 61)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 9)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 9, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 44)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 5, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 23, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g = Game.create(day_id: s5d13.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)

  s5d13.day_rates!
  Day.last.update!(videos: 'FmH0g_tJuyA,qmB1ATClXJE,gG-h41w30FI,wXbhMeJXZVw,vR8ns3tgJcI,xC_bw0Z6-S4,B3PU_rpwAPA,Ksz2EG6jkoQ')
end
