# frozen_string_literal: true

ActiveRecord::Base.transaction do
  season = Season.find @season_id
  day = Day.new(season_id: season.id, date: '21.01.2026'.to_date)
  day.videos = ''
  day.add_players(
    1 => [2, 5, 6, 9, 18, 29],
    2 => [4, 13, 54, 99, 58],
    3 => [21, 48, 3, 93, 95],
    6 => [44, 100, 101, 102, 103],
  )
  day.save
  g = day.games
  g.create(team_left_id: 3, team_right_id: 6).add_goals('3 21 48')
  g.create(team_left_id: 3, team_right_id: 2).add_goals('3 95 48,3 95 93')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 48 95')
  g.create(team_left_id: 3, team_right_id: 6).add_goals('')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('2 4')
  # бел 1 0 оранж 21 (Макс)
  # бел 2 0 зел Кир (Макс) Кир (Штин)
  # бел 1 0 фиол Макс (Кир)
  # бел 0 0 оранж
  # зел 1 0 фио шах
  g.create(team_left_id: 2, team_right_id: 6).add_goals('2 4,2 4 54')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 95,2 4 13,3 95 3')
  g.create(team_left_id: 1, team_right_id: 3).add_goals('3 48 95,3 3')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('3 0 93')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('3 21 93,2 4 58')
  # зел 2 0 оранж шах  _ Шах(Саня) или Ром(Шах)
  # зел 1 2 бел Кир Шах(араз) Кир (ден)
  # фиол 0 2 бел макс(кир) ден
  # оранж 0 1 бел авто-валера(штин)
  # зел 1 1 бел я(шт) шах(ром)
  g.create(team_left_id: 1, team_right_id: 6).add_goals('1 18,1 6 9')
  g.create(team_left_id: 1, team_right_id: 2).add_goals('')
  g.create(team_left_id: 6, team_right_id: 3).add_goals('3 93 95,3 48')
  g.create(team_left_id: 2, team_right_id: 3).add_goals('2 4 13')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 9 2,2 4 54,1 18 29')
  # фиол 2 0 оранж мороз тигр(вова)
  # фиол 0 0 зел
  # оранж 0 2 бел шт(кир) макс
  # зел 1 0 бел шах(араз)
  # зел 1 2 фиол вова(коля) шах(саня т) мороз(камыш)
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 9 18,1 0 2')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('1 29 2,1 18 6')
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 6 2,1 6 29')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 6 2,1 18 2')
  g.create(team_left_id: 3, team_right_id: 1).add_goals('3 95 48,1 29 6,1 2 18')
  # оранж 0 2 фиол вова(мороз) автог(саша_узб(новик)
  # бел 0 2 фиол камыш(новик) мороз(тигр)
  # зел 0 2 фиол тигр(новик) тигр(камыш)
  # оранж 0 2 фиол тигр(новик) мороз(новик)
  # бел 1 2 фиол кир(макс) камыш(тигр) новик(мороз)
  g.create(team_left_id: 2, team_right_id: 1).add_goals('1 6 2,1 2 6')
  g.create(team_left_id: 6, team_right_id: 1).add_goals('1 18 6,1 18 6')
  # зел 0 2 фиол тигр(новик) новик(тигр)
  # оранж 0 2 фиол мороз(тигр) мороз(тигр)

  day.day_rates!
  season.update_stats!
  # Day.last.update(videos: '')
end
