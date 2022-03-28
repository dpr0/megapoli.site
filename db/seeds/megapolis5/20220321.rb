# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s5d16 = Day.new(season_id: @season_id, date: '21.03.2022'.to_date)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 2)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 29)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 5)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 18)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 38)
  s5d16.day_players.new(season_id: @season_id, team_id: 1, player_id: 54)

  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 1)
  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 4)
  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 11)
  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 62)
  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 12)
  s5d16.day_players.new(season_id: @season_id, team_id: 2, player_id: 58)

  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 67)
  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 21)
  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 42)
  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 57)
  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 44)
  s5d16.day_players.new(season_id: @season_id, team_id: 3, player_id: 65)

  s5d16.day_players.new(season_id: @season_id, team_id: 4, player_id: 3)
  s5d16.day_players.new(season_id: @season_id, team_id: 4, player_id: 8)
  s5d16.day_players.new(season_id: @season_id, team_id: 4, player_id: 68)
  s5d16.day_players.new(season_id: @season_id, team_id: 4, player_id: 9)
  s5d16.day_players.new(season_id: @season_id, team_id: 4, player_id: 14)
  s5d16.save

  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 38, assist_player_id: 2)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 29, assist_player_id: 18)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 29, assist_player_id: 18)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 42, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 3, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 3, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 3, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 42, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 54, assist_player_id: 5)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 2, assist_player_id: 29)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 38, assist_player_id: 2)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 54, assist_player_id: 38)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 4, assist_player_id: 12)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 58)
  g = Game.create(day_id: s5d16.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 58, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 12)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 4, assist_player_id: 1)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 4)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 4)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 58, assist_player_id: 1)
  g = Game.create(day_id: s5d16.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)

  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 38, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 29, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 21, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 65, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 4)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 4)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 18, assist_player_id: 54)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 68, assist_player_id: 14)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 8, assist_player_id: 68)
  g = Game.create(day_id: s5d16.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 4)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 1, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 11, assist_player_id: 12)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 68, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 65, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 1, player_id: 54, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 42, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 65, assist_player_id: 21)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = Game.create(day_id: s5d16.id, team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 1, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 12, assist_player_id: nil)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 4, player_id: 68, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 42, assist_player_id: 4)
  g = Game.create(day_id: s5d16.id, team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 21, assist_player_id: 67)

  s5d16.day_rates!
  Day.last.update!(videos: 'paOZQndtuxM,CRMGXLVKt3I,FBL5KU2uf3E,7wypW8DinxI,qsCKCDtSqZw,CWZqxRLaC4I,tn8lqzxMBDY,G9Zo-1vz1B0,PrQRYlCnNGY')
end
# Player.update_stats!(5)
