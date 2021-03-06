# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s5d11 = Day.new(season_id: @season_id, date: '16.02.2022'.to_date)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id:  2)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id:  5)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id:  6)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id: 14)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id: 18)
  s5d11.day_players.new(season_id: @season_id, team_id: 1, player_id: 38)

  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id:  4)
  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id:  7)
  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id:  1)
  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id: 12)
  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id: 23)
  s5d11.day_players.new(season_id: @season_id, team_id: 2, player_id: 58)

  s5d11.day_players.new(season_id: @season_id, team_id: 3, player_id:  9)
  s5d11.day_players.new(season_id: @season_id, team_id: 3, player_id: 21)
  s5d11.day_players.new(season_id: @season_id, team_id: 3, player_id: 22)
  s5d11.day_players.new(season_id: @season_id, team_id: 3, player_id: 42)
  s5d11.day_players.new(season_id: @season_id, team_id: 3, player_id: 48)
  s5d11.save

  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 49, assist_player_id: 21)
  g = Game.create(day_id: s5d11.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: 12)
  g.goals.create(team_id: 1, player_id: nil, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 1)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g = Game.create(day_id: s5d11.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: 21)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 1)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: 1)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 1)

  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 2)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 6)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 2)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g = Game.create(day_id: s5d11.id, team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 7)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 23)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g = Game.create(day_id: s5d11.id, team_left_id: 3, goals_left: 3, goals_right: 5, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: nil)

  s5d11.day_rates!
  Day.last.update!(videos: 'aNsmk3xYdO0,q4eDIul9VgY')
end
