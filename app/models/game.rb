# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :goals
  belongs_to :day, optional: true

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

      case d[0]
      when team_left_id  then update(goals_left:  (goals_left  || 0) + 1)
      when team_right_id then update(goals_right: (goals_right || 0) + 1)
      end
    end

    @left_team_elo   = team_elo(dps, 'left')
    @right_team_elo  = team_elo(dps, 'right')
    update(
      left_team_elo:          @left_team_elo,
      right_team_elo:         @right_team_elo,
      left_team_elo_change:   calc_elo(dps, 'left', 'right'),
      right_team_elo_change:  calc_elo(dps, 'right', 'left')
    )
  end

  private

  def calc_elo(dps, side1, side2)
    rate_a  = eval("@#{side1}_team_elo")
    rate_b  = eval("@#{side2}_team_elo")
    goals_a = eval("goals_#{side1}")
    goals_b = eval("goals_#{side2}")
    e = 1 / (1 + (10**((rate_b - rate_a) / 400.0)))
    s = [0.5, 1.0, 0.0][goals_a <=> goals_b]
    new_team_elo_change = calc_k(rate_a) * calc_g(goals_a, goals_b) * (s - e)
    d_p = dps.select { |x| x.team_id == eval("team_#{side1}_id") }
    array = d_p.map do |dp|
      bonus = [Player::K_ELO, Player::K_ELO * 2, 0][goals_a <=> goals_b]
      new_player_elo = (new_team_elo_change * d_p.size * (dp.elo / d_p.sum(&:elo))) + dp.elo + bonus
      {id: dp.id, new_elo: ((new_player_elo + Player::K_ELO)*100).to_i.to_f / 100 }
    end
    DayPlayer.upsert_all(array)
    new_team_elo_change
  end

  def team_elo(dps, side)
    players = dps.select { |x| x.team_id == eval("team_#{side}_id") }
    players.sum(&:elo).to_i / players.count
  end

  def calc_k(rate)
    (1000-rate) / 50.0 * 4
  end

  def calc_g(a, b)
    bigger = [a, a, b][a <=> b]         # when 0 then 1
    lower = bigger == a ? b : a         # when 1 then 1
    n = bigger - lower                  # when 2 then 1.5
    [1.5, (11 + n) / 8.0, 1.0][n <=> 2] # else (11 + n) / 8
  end
end
