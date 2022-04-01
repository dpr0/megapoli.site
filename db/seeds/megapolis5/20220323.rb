# frozen_string_literal: true

ActiveRecord::Base.transaction do
  # @season_id = 5
  # day = Day.new(season_id: @season_id, date: '23.03.2022'.to_date)
  # day.videos = '1p7ugHBe7zc,X9d9Yu1BzPs,FJr8JJ_a_e0,eBxAuObb8BM,n7aH_qoy7gg,ZApcX-CbJXs'
  # {
  #   # 1 => [ 5,  2, 29, 38, 18,  6],
  #   # 2 => [ 1, 10, 11,  4,  9, 58],
  #   # 3 => [21, 22, 17, 45, 57,  8],
  #   # 4 => [     3, 23, 14, 67, 68]
  # }.each do |key, val|
  #   val.map { |x| {team_id: key, player_id: x, season_id: day.season_id} }
  #      .each { |attrs| day.day_players.new(attrs) }
  # end
  # day.save
  #
  # g = day.games.create(team_left_id: , goals_left: 0, goals_right: 0, team_right_id: )
  # g.goals.create(team_id: , player_id: , assist_player_id: nil)
  #
  # day.day_rates!
end
# Player.update_stats!(5)
