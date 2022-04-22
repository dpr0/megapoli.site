# frozen_string_literal: true

ActiveRecord::Base.transaction do
  @season_id = 5
  day = Day.new(season_id: @season_id, date: '20.04.2022'.to_date)
  day.videos = 'B86it0HBYGQ,VtNQydRRTRs,d8KN2lV3lYI,YWnMunrbR70,1MUwayb5O-c,nnnKYwKhJqM,y0r0fYycffQ,_vsrpBEB8q4'
  {
    1 => [ 5,  2,  6, 38, 14, 12, 54],
    3 => [21, 22, 42, 44, 17, 48, 57],
    4 => [ 1,  9, 58, 23, 67]
  }.each do |key, val|
    val.each { |x| day.day_players.new(team_id: key, player_id: x, season_id: day.season_id) }
  end
  day.save

  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 17)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 22)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 22)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 17)
  g.goals.create(team_id: 3, player_id: 17, assist_player_id: 22)
  g.goals.create(team_id: 1, player_id: 5, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 21)
  g.goals.create(team_id: 4, player_id: 44, assist_player_id: 58)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 12)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 54)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 57)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 57)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 21)
  g = day.games.create(team_left_id: 1, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 57)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: 48)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 54)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 22)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 1, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 57)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 22)
  g = day.games.create(team_left_id: 4, goals_left: 2, goals_right: 1, team_right_id: 3)
  g.goals.create(team_id: 4, player_id: 67, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 1, assist_player_id: 67)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 4, player_id: 67, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 2)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 57, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 22, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 6, assist_player_id: 38)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 6)
  g = day.games.create(team_left_id: 4, goals_left: 1, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 4, player_id: 1, assist_player_id: 9)

  day.day_rates!
end
