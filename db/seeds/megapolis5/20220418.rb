# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '18.04.2022'.to_date)
  day.videos = 'AbMQNY8QNIE,nKIr18q1ljw,ifIMDQSpYv8,wNXJay0odqI,dud_2bwOats,kJqQs7Og7xo,urIPjeGpJUk,Z4BQTU3Sf3o,-FKit3ewjtw'
  {
    1 => [ 5,  2,  6, 38, 14, 18],
    3 => [21, 22, 42, 44, 54, 48,  9],
    4 => [35, 65, 66, 58, 23, 12, 11]
  }.each do |key, val|
    val.each { |x| day.day_players.new(team_id: key, player_id: x, season_id: day.season_id) }
  end
  day.save

  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 14)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 54)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil) # ?
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 2)
  g.goals.create(team_id: 4, player_id: 11, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 2)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 54, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: nil, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 54, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 4, player_id: 58, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 18)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 4, player_id: 11, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 11, assist_player_id: 65)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 4, player_id: 11, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 9, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 4, player_id: 65, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: nil, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 4, player_id: 65, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 42, assist_player_id: 65)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 4, player_id: 6, assist_player_id: nil)

  day.day_rates!
end
