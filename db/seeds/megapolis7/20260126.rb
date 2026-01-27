# frozen_string_literal: true

ActiveRecord::Base.transaction do
  # season = Season.find @season_id
  season = Season.last
  day = Day.new(season_id: season.id, date: '26.01.2026'.to_date)
  day.videos = ''
  day.add_players(
    1 => [103, 12, 5, 44, 62, 18, 102],
    3 => [104, 1, 48, 93, 58, 14],
    4 => [101, 3, 29, 97, 6, 10],
    6 => [21, 13, 4, 19, 54, 95, 9],
  )
  day.save
  g = day.games
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 93 48, 3 1 93')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('')
  g.create(team_left_id: 6, team_right_id: 4).add_goals('6 54')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('6 95 4,1 18')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('4 101 29,3 48')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 102 18,6 4 13,6 4 13')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('3 93 7,6 54 21,6 54 21')
  g.create(team_left_id: 6, team_right_id: 4).add_goals('6 13 4,4 97 6,4 6 29')
  g.create(team_left_id: 1, team_right_id: 4).add_goals('4 6 29')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('3 0 48,3 104 7')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('')
  g.create(team_left_id: 1, team_right_id: 4).add_goals('1 102 44')
  g.create(team_left_id: 1, team_right_id: 6).add_goals('')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('3 1 48')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 14 58')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 58 48,3 58 14')
  g.create(team_left_id: 3, team_right_id: 4).add_goals('4 6 10,4 29')
  g.create(team_left_id: 1, team_right_id: 4).add_goals('4 6 29')
  g.create(team_left_id: 6, team_right_id: 4).add_goals('6 4 19,6 95 9')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('')

  day.day_rates!
  season.update_stats!
  # Day.last.update(videos: '')
end
