# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s5d10 = Day.new(season_id: @season_id, date: '09.02.2022'.to_date)
  s5d10.day_players.new(season_id: @season_id, team_id: 1, player_id:  2)
  s5d10.day_players.new(season_id: @season_id, team_id: 1, player_id:  5)
  s5d10.day_players.new(season_id: @season_id, team_id: 1, player_id:  6)
  s5d10.day_players.new(season_id: @season_id, team_id: 1, player_id: 18)
  s5d10.day_players.new(season_id: @season_id, team_id: 1, player_id: 38)

  s5d10.day_players.new(season_id: @season_id, team_id: 2, player_id:  4)
  s5d10.day_players.new(season_id: @season_id, team_id: 2, player_id:  9)
  s5d10.day_players.new(season_id: @season_id, team_id: 2, player_id:  1)
  s5d10.day_players.new(season_id: @season_id, team_id: 2, player_id:  8)
  s5d10.day_players.new(season_id: @season_id, team_id: 2, player_id: 12)

  s5d10.day_players.new(season_id: @season_id, team_id: 3, player_id: 21)
  s5d10.day_players.new(season_id: @season_id, team_id: 3, player_id: 22)
  s5d10.day_players.new(season_id: @season_id, team_id: 3, player_id: 49)
  s5d10.day_players.new(season_id: @season_id, team_id: 3, player_id: 57)
  s5d10.day_players.new(season_id: @season_id, team_id: 3, player_id: 23)
  s5d10.save

  g = Game.create(day_id: s5d10.id, team_left_id: 3, goals_left: 3, goals_right: 7, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 2)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 22)
  g.goals.create(team_id: 3, player_id: 8, assist_player_id: 22)
  g.goals.create(team_id: 1, player_id: 1, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 12)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 49)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 1)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 22)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 2)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 1)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 9)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 4)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 18)
  g = Game.create(day_id: s5d10.id, team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 49)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 1)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 9, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: nil)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 8)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 4)
  g = Game.create(day_id: s5d10.id, team_left_id: 2, goals_left: 2, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 12)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 22)
  g.goals.create(team_id: 2, player_id: 8, assist_player_id: 1)

  s5d10.day_rates!
  Day.last.update!(videos: 'xy6AL70hbQ0,6VfdEtqO6t0,VveeKDxkC1E,pfmdJBFZqKo,kb60Essv23Y,KPpd_ghj5FA,JcLaoOLPF4s,bL46K6zICMI,n39wvF4c7V4')
end
