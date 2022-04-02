# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '23.03.2022'.to_date)
  day.videos = '1p7ugHBe7zc,X9d9Yu1BzPs,FJr8JJ_a_e0,eBxAuObb8BM,n7aH_qoy7gg,ZApcX-CbJXs'
  {
    1 => [ 2,  5,  6, 14, 18, 38],
    2 => [ 1,  4,  7, 11, 12, 62],
    3 => [17, 21, 42, 44, 48, 67],
    4 => [     8,  9, 23, 54, 58]
  }.each do |key, val|
    val.map { |x| {team_id: key, player_id: x, season_id: day.season_id} }
       .each { |attrs| day.day_players.new(attrs) }
  end
  day.save

  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 17)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 42)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 42)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 17)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 4, player_id: 8, assist_player_id: 58)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 62)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 6)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 11)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 38)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 4, player_id: 58, assist_player_id: 54)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 18)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 5)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 2)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 6)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 44)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 7)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 4, player_id: 54, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: 4)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 7, assist_player_id: 1)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 67)
  g.goals.create(team_id: 3, player_id: 67, assist_player_id: 44)

  day.day_rates!
end
# Player.update_stats!(5)
