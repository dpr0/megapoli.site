# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '11.04.2022'.to_date)
  day.videos = 'zWimoPUmZ48,44sl0sT4Xn4,xhCV0zpIOvQ,qG0oxykdBto,YbwtrdTTbXU,e7jmW_7ahH8,hldNQzEc9vw,pyx3_4_UDjI,SzuIQHYglHQ'
  day.add_players(
    1 => [ 5,  2,  6, 38, 29, 14, 54],
    2 => [ 4, 10, 11, 12,  1, 62, 58],
    3 => [21, 22, 17, 42, 44, 57, 48],
    4 => [23, 67, 65, 9, 35, 68]
  )
  day.save

  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 54, assist_player_id: 6)
  g.goals.create(team_id: 1, player_id: 54, assist_player_id: 38)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: 38)
  g.goals.create(team_id: 2, player_id: nil, assist_player_id: 10)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 54)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 22)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 4)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 2, goals_left: 1, goals_right: 2, team_right_id: 4)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 65, assist_player_id: 67)
  g.goals.create(team_id: 4, player_id: 68, assist_player_id: 67)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 0, team_right_id: 4)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 2)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 17)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 42)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 2, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 1)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 1)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 4, player_id: 67, assist_player_id: 65)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 10)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 11)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 4)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 0, team_right_id: 3)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 10, assist_player_id: 11)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 54, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 14)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 2)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 54)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: 54)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 54, assist_player_id: 29)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 11, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: 4)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 57)

  day.day_rates!
end
