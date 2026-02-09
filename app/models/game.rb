# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :goals
  belongs_to :day

  def rated(side)
    r = attributes["#{side}_team_elo_change"]
    "#{'+' if r >= 0}#{r}"
  end

  def rated_class(side)
    "has-text-#{%w[grey primary danger][attributes["#{side}_team_elo_change"] <=> 0]}"
  end

  def add_goals(z = [], str = '')
    s_id = z.first
    dps = z.last
    str.split(',').each do |a|
      d = a.split(' ').map(&:to_i)
      Goal.create(team_id: d[0], player_id: d[1], assist_player_id: d[2], season_id: s_id, game_id: id)

      if d[1].to_i > 0 && d[2].to_i > 0
        stat = dps.find { |x| x.player_id == d[1] }
        if stat
          stat.elo = stat.elo + Player::K_ELO
          stat.save(validate: false)
        end
        stat = dps.find { |x| x.player_id == d[2] }
        if stat
          stat.elo = stat.elo + Player::K_ELO
          stat.save(validate: false)
        end
      elsif d[1].to_i > 0 || d[2].to_i > 0
        stat = dps.find { |x| x.player_id == d[1].to_i > 0 ? d[1] : d[2] }
        if stat
          stat.elo = stat.elo + Player::K_ELO * 2
          stat.save(validate: false)
        end
      end

      if team_left_id == d[0]
        update(goals_left: (goals_left || 0) + 1)
      elsif team_right_id == d[0]
        update(goals_right: (goals_right || 0) + 1)
      else
        # byebug
      end
    end

    @left_team_elo   = team_elo('left')
    @right_team_elo  = team_elo('right')
    update(
      left_team_elo:          @left_team_elo,
      right_team_elo:         @right_team_elo,
      left_team_elo_change:   calc_elo('left', 'right'),
      right_team_elo_change:  calc_elo('right', 'left')
    )
  end

  private

  def calc_elo(side1, side2)
    rate_a  = eval("@#{side1}_team_elo")
    rate_b  = eval("@#{side2}_team_elo")
    goals_a = eval("goals_#{side1}")
    goals_b = eval("goals_#{side2}")
    e = 1 / (1 + (10**((rate_b - rate_a) / 400.0)))
    s = [0.5, 1.0, 0.0][goals_a <=> goals_b]
    new_team_elo_change = calc_k(rate_a) * calc_g(goals_a, goals_b) * (s - e)
    d_p = dplayers(side1)
    array = d_p.map do |dp|
      bonus = [Player::K_ELO, Player::K_ELO * 2, 0][goals_a <=> goals_b]
      new_player_elo = (new_team_elo_change * d_p.size * (dp.elo / d_p.sum(&:elo))) + dp.elo + bonus
      {id: dp.id, new_elo: ((new_player_elo + Player::K_ELO)*100).to_i.to_f / 100 }
    end
    DayPlayer.upsert_all(array)
    new_team_elo_change
  end

  def dplayers(side)
    all_day_players.select { |x| x.team_id = eval("team_#{side}_id") }
  end

  def all_day_players
    @all_day_players ||= DayPlayer.where(day_id: day.id).to_a
  end

  def all_stats
    @stats ||= DayPlayer.where(season_id: day.season_id).to_a
  end

  def team_elo(side)
    players = dplayers(side)
    stats = all_stats.select { |x| players.map(&:player_id).include? x.player_id }
    stats.map(&:elo).sum(0.0) / players.count
  end

  def calc_k(rate)
    return (1000-rate) / 50.0 * 4

    case rate
    # when 1900..2999 then 5
    # when 1850..1899 then 10
    # when 1800..1849 then 15
    # when 1750..1799 then 20
    # when 1700..1749 then 25
    # when 1650..1699 then 30
    # when 1600..1649 then 35
    # when 1550..1599 then 40
    # when 1500..1549 then 45

    # when 1900..2999 then 5
    # when 1800..1899 then 10
    # when 1700..1799 then 20
    # when 1600..1699 then 30
    # when 1500..1599 then 40
    # when 1400..1499 then 50
    # when 1300..1399 then 60
    # else 70
    # end
    when 1000..2000 then 1
    when 950..999 then 4
    when 900..949 then 7
    when 850..899 then 10
    when 800..849 then 13
    when 750..799 then 16
    when 700..749 then 19
    when 650..699 then 22
    when 600..649 then 25
    when 550..599 then 28
    when 500..549 then 31
    when 450..499 then 34
    when 400..449 then 37
    when 350..399 then 40
    when 300..349 then 43
    else 46
    end
  end

  def calc_g(a, b)
    bigger = [a, a, b][a <=> b]         # when 0 then 1
    lower = bigger == a ? b : a         # when 1 then 1
    n = bigger - lower                  # when 2 then 1.5
    [1.5, (11 + n) / 8.0, 1.0][n <=> 2] # else (11 + n) / 8
  end
end
