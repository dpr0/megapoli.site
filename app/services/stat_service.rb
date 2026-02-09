class StatService
  attr_reader :day_games, :win3, :win2, :win1, :draw, :lose

  def initialize(team_id, games)
    @team_id = team_id
    @games = games
  end

  def day_games
    @day_games = @games.count { |x| x.team_left_id == @team_id || x.team_right_id == @team_id }
  end

  def win3
    @win3 = @games.count { |x| (x.team_left_id == @team_id && x.goals_left >= 2 && x.goals_right == 0) || (x.team_right_id == @team_id && x.goals_left == 0 && x.goals_right >= 2) }
  end

  def win2
    @win2 = @games.count do |x|
      ((x.team_left_id  == @team_id && x.goals_left >= 2 && x.goals_right == 1) ||
       (x.team_right_id == @team_id && x.goals_left == 1 && x.goals_right >= 2)) ||
      ((x.team_left_id  == @team_id && x.goals_left >= 2 && x.goals_right < x.goals_left && x.goals_right > 0) ||
       (x.team_right_id == @team_id && x.goals_left < x.goals_right && x.goals_right >= 2 && x.goals_left > 0))
    end
  end

  def win1
    @win1 = @games.count { |x| (x.team_left_id == @team_id && x.goals_left == 1 && x.goals_right == 0) || (x.team_right_id == @team_id && x.goals_left == 0 && x.goals_right == 1) }
  end

  def draw
    @draw = @games.count { |x| (x.team_left_id == @team_id && x.goals_left == x.goals_right ) || (x.team_right_id == @team_id && x.goals_left == x.goals_right) }
  end

  def lose
    @lose = @games.count { |x| (x.team_left_id == @team_id && x.goals_left < x.goals_right) || (x.team_right_id == @team_id && x.goals_left > x.goals_right) }
  end
end
