# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find @season_id
  day = Day.new(season_id: season.id, date: '14.08.2024'.to_date)
  day.videos = ''
  day.add_players(
    1 => [6, 5, 18, 96, 97],
    2 => [13, 4, 1, 60, 9],
    3 => [21, 17, 54, 44, 95]
  )
  day.save
  g = day.games
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 95 44,3 21')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 54 17,3 17 21')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('2 4,2 1 4')
  g.create(team_left_id: 2, team_right_id: 1).add_goals
  g.create(team_left_id: 3, team_right_id: 1).add_goals('1 18 6,1 96 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 96 18,2 4 13,1 97 6')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('1 18 6,1 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 96 18,2 4 13')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('1 97 18,1 96 18')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('2 1,2 13,1 18')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 17 21,3 21 54')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 96,1 6 18')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('1 18 96,1 96 18')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 96 18,1 96 18')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('2 1 60,2 4 13')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('3 95 21,2 4,2 1 4')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('2 13 1,1 18,1 18 96')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('1 18,1 18')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('1 96 97')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 17 21,1 18,1 18 6')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('2 1 60,2 60 1')

  day.day_rates!
  season.update_stats!
  # Day.last.update(videos: '')
end
