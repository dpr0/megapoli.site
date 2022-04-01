# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '30.03.2022'.to_date)
  day.videos = '3vxv19NYFPI,cTUqvUWJqCk,SSI5b81AlvI,AUvP-zaOz_M,82dB7Q-HwPw,IHTHmKWiQA8,2PkVUm3i2qU,L8V-n9z7K0w,m3CN4r22lVQ'
  {
    1 => [ 5,  2,  6, 38, 18, 14],
    2 => [ 4, 10, 11, 12,  9, 62],
    3 => [21, 22, 17, 42, 44, 57, 48],
    4 => [23, 67, 65]
  }.each do |key, val|
    val.map { |x| {team_id: key, player_id: x, season_id: day.season_id} }
       .each { |attrs| day.day_players.new(attrs) }
  end
  day.save

  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: nil, assist_player_id: 38)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 4)
  g.goals.create(team_id: 4, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 42, assist_player_id: 67)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 4, player_id: nil, assist_player_id: 67)
  g.goals.create(team_id: 4, player_id: 67, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 10, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 10)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 62)
  g.goals.create(team_id: 4, player_id: 57, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)

  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 4)
  g.goals.create(team_id: 4, player_id: 65, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: nil, assist_player_id: 23)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 21)
  g.goals.create(team_id: 4, player_id: 23, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 2)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 42)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 21)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 22)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 42)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 44)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: 21)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 4, assist_player_id: nil)

  day.day_rates!
end
# Player.update_stats!(5)
