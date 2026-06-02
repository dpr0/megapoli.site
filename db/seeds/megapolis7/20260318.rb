# frozen_string_literal: true

ActiveRecord::Base.transaction do
  s = Season.last
  day = Day.create(season_id: s.id, date: '18.03.2026'.to_date)
  day.add_players(
    1 => [18, 2, 5, 14, 97, 29],
    3 => [1, 13, 58, 7, 24, 104],
    6 => [109, 112, 103, 108, 6],
    7 => [12, 95, 42, 60, 50, 19],
  )

  g = day.games
  dps = day.day_players
  z = [s.id, dps]
  g.create(team_left_id: , team_right_id: ).add_goals(z, '')

  day.day_rates!(dps)
  s.update_stats!(dps, day.games)
end
