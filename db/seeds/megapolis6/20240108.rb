# frozen_string_literal: true

ActiveRecord::Base.transaction do
  day = Day.new(season_id: @season_id, date: '08.01.2024'.to_date)
  day.videos = ''
  day.add_players(
    2 => [ 21, 44, 61, 10, 93, 9, 58],
    3 => [ 94, 23, 3, 5, 62, 30]
  )
  day.save

  g = day.games.create(team_left_id: , goals_left: , goals_right: , team_right_id: )
  g.goals.create(team_id: 2, player_id: , assist_player_id: nil)


  day.day_rates!
  Player.update_stats!(@season_id)
  Day.last.update(videos: '')
end
