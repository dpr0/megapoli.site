# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '11.05.2022'.to_date)
  day.videos = 'wM89c4EpET8,Ep0oHFkw-fg,-EuKnkON1WM,P1ulnNEaGow,dghOtLYQp04,uWwTNuh30Yo,qbpgNXXYvrA,mXTUBvi_vTk,mITRjh8uZ04'
  day.add_players(
    2 => [ 3, 4, 12, 14, 23, 38, 58],
    3 => [ 5, 9, 10, 21, 25]
  )
  day.save

  g = day.games.create(team_left_id: 2, goals_left: 11, goals_right: 6, team_right_id: 3)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 3, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 3, assist_player_id: 38)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 3)
  g.goals.create(team_id: 3, player_id: 25, assist_player_id: 10)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 12)
  g.goals.create(team_id: 2, player_id: 23, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: 38)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 25)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 12)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 3, assist_player_id: 23)
  g.goals.create(team_id: 3, player_id: 9, assist_player_id: 25)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 25, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 12)

  g = day.games.create(team_left_id: 2, goals_left: 10, goals_right: 2, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 58)
  g.goals.create(team_id: 3, player_id: 23, assist_player_id: 25)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 25, assist_player_id: 21)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: nil, assist_player_id: 12)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 38)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 38)

  g = day.games.create(team_left_id: 2, goals_left: 11, goals_right: 4, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 10, assist_player_id: 9)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 23)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 10)
  g.goals.create(team_id: 2, player_id: 58, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 4)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 9, assist_player_id: 25)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: 14)
  g.goals.create(team_id: 2, player_id: 38, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: 3)
  g.goals.create(team_id: 3, player_id: 5, assist_player_id: 10)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: nil)

  g = day.games.create(team_left_id: 2, goals_left: 4, goals_right: 3, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: 23, assist_player_id: 38)
  g.goals.create(team_id: 2, player_id: 23, assist_player_id: 3)
  g.goals.create(team_id: 2, player_id: 14, assist_player_id: 10)
  g.goals.create(team_id: 2, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 10)
  g.goals.create(team_id: 3, player_id: 10, assist_player_id: nil)
  g.goals.create(team_id: 3, player_id: 10, assist_player_id: nil)

  day.day_rates!
end
