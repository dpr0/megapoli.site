# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find 7 # @season_id
  day = Day.new(season_id: season.id, date: '14.08.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [6, 5, 18, 96, 97],
    2 => [13, 4, 1, 60, 9],
    3 => [21, 17, 54, 44, 95]
  )
  day.save

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 95, assist_player_id: 44)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3 )
  g.goals.create(team_id: 3, player_id: 54, assist_player_id: 17 )
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 21)

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3 )
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)

  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 1)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)

  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 1 )
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 13)
  g.goals.create(team_id: 1, player_id: 97, assist_player_id: 6)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)

  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 13)

  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 97, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 13, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)

  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 21)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 54)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 18)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 96)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 96, assist_player_id: 18)

  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 60)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 13)

  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 95, assist_player_id: 21)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 4)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 13, assist_player_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 96)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)

  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1 , player_id: 96, assist_player_id: 97)

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 21)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 6)

  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 1, assist_player_id: 60)
  g.goals.create(team_id: 2, player_id: 60, assist_player_id: 1)

  day.day_rates!
  season.update_stats!
  Day.last.update(videos: '')
end
