# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '16.05.2022'.to_date)
  day.videos = ''
  day.add_players(
    1 => [  2,  6, 18, 25, 29, 38, 62],
    3 => [ 11, 17, 21, 42, 44, 48, 57],
    4 => [  9, 35, 22, 14, 10, 65, 66],
  )
  day.save

  # g = day.games.create(team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)

  day.day_rates!
end
