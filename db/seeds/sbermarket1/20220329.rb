# frozen_string_literal: true

ActiveRecord::Base.transaction do
  @season_id = 6
  day = Day.new(season_id: @season_id, date: '29.03.2022'.to_date)
  day.videos = ''
  {
    5 => [21,70,76,78,79,13],
    3 => [71,75,80,81,82],
    2 => [83,84,85,86,87],
  }.each do |key, val|
    val.map { |x| {team_id: key, player_id: x, season_id: day.season_id} }
       .each { |attrs| day.day_players.new(attrs) }
  end
  day.save

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 5)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 21, assist_player_id: 70)
  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 5)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 84, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 85, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 79, assist_player_id: 13)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 5, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 21, assist_player_id: 13)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 81, assist_player_id: 75)
  g = day.games.create(team_left_id: 5, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 79, assist_player_id: 13)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 85, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 85, assist_player_id: 84)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 86, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 5)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 70, assist_player_id: 79)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 79, assist_player_id: 21)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 5)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 70, assist_player_id: 79)
  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 5)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 84, assist_player_id: 83)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 13, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 85, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 3, player_id: 81, assist_player_id: 75)
  g = day.games.create(team_left_id: 5, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 13, assist_player_id: 78)
  g = day.games.create(team_left_id: 5, goals_left: 3, goals_right: 1, team_right_id: 2)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 70, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 70, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 5, player_id: 76, assist_player_id: nil)
  g.goals.create(season_id: @season_id, team_id: 2, player_id: 85, assist_player_id: nil)

  day.day_rates!
end
# Player.update_stats!(season_id)
