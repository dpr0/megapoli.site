# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find 7 # @season_id
  day = Day.new(season_id: season.id, date: '12.08.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [26, 6, 5, 29, 9, 96, 97],
    2 => [13, 2, 4, 10, 58, 14, 60],
    3 => [21, 30, 17, 54, 48, 44, 95]
  )
  day.save

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 48)
  g.goals.create(team_id: 2, player_id: 60, assist_player_id: 2)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 54)

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 95)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 30)

  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 95, assist_player_id: 30)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 6)

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 2)

  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 48)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 26, assist_player_id: 29)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 6)

  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 29)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 95)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 96)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 6)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 9, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 6)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 95)
  g.goals.create(team_id: 1, player_id: 97, assist_player_id: 96)
  g.goals.create(team_id: 1, player_id: 26, assist_player_id: 29)

  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 96)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 58)

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 30, assist_player_id: 48)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 30)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: 10)

  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 3)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 2)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 29)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: 96)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 48)
  g.goals.create(team_id: 1, player_id: 26, assist_player_id: 96)
  g.goals.create(team_id: 1, player_id: 26, assist_player_id: nil)

  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 60, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 60, assist_player_id: 2)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 21)

  day.day_rates!
  season.update_stats!
  Day.last.update(videos: '')
end


