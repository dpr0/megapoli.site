# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '12.04.2022'.to_date)
  day.videos = 'IsiuPeDC2gw,9URzANAJTyE,TJgQt6K8g0c,IdFd-PeFohQ,O9mcZ1K2Vjo,3FtVo0s44RI,MvZzyBCQNSk'
  day.add_players(
    3 => [13,21,71,76,83],
    4 => [88,79,75,91,92],
    5 => [70,90,85,89,77,87],
  )
  day.save

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 5)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 13)
  g.goals.create(team_id: 3, player_id: 76, assist_player_id: 21)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 76, assist_player_id: 83)
  g.goals.create(team_id: 3, player_id: 71, assist_player_id: 21)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 5)
  g.goals.create(team_id: 3, player_id: 71, assist_player_id: 76)
  g.goals.create(team_id: 5, player_id: 77, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 70, assist_player_id: 90)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: 90)

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 1, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 70, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 71)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 13)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 71, assist_player_id: 76)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: nil)
  g.goals.create(team_id: 5, player_id: 85, assist_player_id: 89)

  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 1, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 88, assist_player_id: 90)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 13, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 83, assist_player_id: nil)
  g = day.games.create(team_left_id: 5, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: nil)
  g.goals.create(team_id: 5, player_id: 92, assist_player_id: 70)

  g = day.games.create(team_left_id: 5, goals_left: 1, goals_right: 2, team_right_id: 4)
  g.goals.create(team_id: 4, player_id: 75, assist_player_id: 88)
  g.goals.create(team_id: 4, player_id: 88, assist_player_id: 75)
  g.goals.create(team_id: 5, player_id: 70, assist_player_id: 85)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 83, assist_player_id: 76)
  g.goals.create(team_id: 4, player_id: 77, assist_player_id: 79)
  g.goals.create(team_id: 4, player_id: 88, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: 77)
  g.goals.create(team_id: 5, player_id: 70, assist_player_id: 77)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 90, assist_player_id: nil)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: 70)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 3, team_right_id: 5)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: 77)
  g.goals.create(team_id: 5, player_id: 77, assist_player_id: nil)
  g.goals.create(team_id: 5, player_id: 89, assist_player_id: 70)
  g.goals.create(team_id: 4, player_id: 75, assist_player_id: 88)

  day.day_rates!
end
