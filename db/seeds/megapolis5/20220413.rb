# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '13.04.2022'.to_date)
  day.videos = 'v-Q_dMveAbI,Ka4sqazu1s4,pc5AOc2feIc,89dVfw8F2n0,64wrjZZAyx0,QL2tUmt0ehk,k6CpJfRlKK8,6omZfaqmoec,T5DpS4bdfS8'
  {
    1 => [ 5, 25,  6, 38, 29, 18],
    2 => [ 4, 10, 12, 54, 23, 68],
    3 => [21, 17, 42, 44, 57, 48],
    4 => [35,  1,  9, 61, 14]
  }.each do |key, val|
    val.each { |x| day.day_players.new(team_id: key, player_id: x, season_id: day.season_id) }
  end
  day.save

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 2, player_id: nil, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 68, assist_player_id: 4)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 21, assist_player_id: 42)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 21)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 1, goals_right: 1, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: nil)
  g.goals.create(team_id: 4, player_id: 14, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 0, team_right_id: 1)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 3, player_id: 44, assist_player_id: 17)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 57)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 25, assist_player_id: nil)
  g = day.games.create(team_left_id: 4, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 4, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 2, goals_right: 0, team_right_id: 1)
  g.goals.create(team_id: 3, player_id: 48, assist_player_id: 21)
  g.goals.create(team_id: 3, player_id: 42, assist_player_id: 48)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: 4)

  g = day.games.create(team_left_id: 2, goals_left: 2, goals_right: 0, team_right_id: 4)
  g.goals.create(team_id: 2, player_id: 23, assist_player_id: nil)
  g.goals.create(team_id: 2, player_id: 54, assist_player_id: nil)
  g = day.games.create(team_left_id: 2, goals_left: 0, goals_right: 2, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: 5)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: 25)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 1)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 38, assist_player_id: 18)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 5, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g.goals.create(team_id: 1, player_id: 18, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 2, goals_right: 0, team_right_id: 3)
  g.goals.create(team_id: 1, player_id: 14, assist_player_id: 18)
  g.goals.create(team_id: 1, player_id: 25, assist_player_id: nil)
  g = day.games.create(team_left_id: 1, goals_left: 1, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 1, player_id: 29, assist_player_id: 18)
  g.goals.create(team_id: 2, player_id: 12, assist_player_id: nil)
  g = day.games.create(team_left_id: 3, goals_left: 0, goals_right: 1, team_right_id: 2)
  g.goals.create(team_id: 2, player_id: 4, assist_player_id: nil)

  day.day_rates!
end
