# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s5d2 = Day.new(season_id: @season_id, date: '12.01.2022'.to_date)
  s5d2.day_players.new(season_id: @season_id, team_id: 1, player_id: 38)
  s5d2.day_players.new(season_id: @season_id, team_id: 1, player_id:  6)
  s5d2.day_players.new(season_id: @season_id, team_id: 1, player_id: 18)
  s5d2.day_players.new(season_id: @season_id, team_id: 1, player_id: 52)
  s5d2.day_players.new(season_id: @season_id, team_id: 1, player_id: 58)

  s5d2.day_players.new(season_id: @season_id, team_id: 3, player_id: 61)
  s5d2.day_players.new(season_id: @season_id, team_id: 3, player_id: 17)
  s5d2.day_players.new(season_id: @season_id, team_id: 3, player_id: 21)
  s5d2.day_players.new(season_id: @season_id, team_id: 3, player_id: 22)
  s5d2.day_players.new(season_id: @season_id, team_id: 3, player_id:  8)

  s5d2.day_players.new(season_id: @season_id, team_id: 4, player_id:  1)
  s5d2.day_players.new(season_id: @season_id, team_id: 4, player_id:  2)
  s5d2.day_players.new(season_id: @season_id, team_id: 4, player_id:  4)
  s5d2.day_players.new(season_id: @season_id, team_id: 4, player_id:  9)
  s5d2.day_players.new(season_id: @season_id, team_id: 4, player_id: 23)
  s5d2.save

  g4 = Game.create(day_id: s5d2.id, team_left_id: 1, goals_left: 10, goals_right: 3, team_right_id: 3)
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 1, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 3, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 3, player_id: , assist_player_id: )
  # g4.goals.create(season_id: @season_id, team_id: 3, player_id: , assist_player_id: )

  s5d2.day_rates!
  Day.last.update!(videos: 'VFbm4y_ACz8бo2AfJpOx2MAбQJUKTtHGtlcбvn4RwizGXF0бy1KFRc4jIr8бPxEb0xfAN10бdJnDEvam0NIбmGJmet1myaEб7Um_UpNisS8')
end
