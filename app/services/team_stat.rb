class TeamStat

  def initialize(games, day)
    @day = day
    @games = games
    @gl = Day::GL
    @gr = Day::GR
  end

  def data
    @day_players = @day.day_players_by_season(@day.season.id).group_by(&:team_id).sort.to_h
    @teams = @games.map { |x| [x['team_left_id'], x['team_right_id']] }.flatten.uniq.sort.map { |team_id| Team.cached_by_id[team_id] }
    @teams.map do |team|
      games = @games.select { |x| [x['team_left_id'], x['team_right_id']].include? team.id }
      games(team, games)
    end
  end

  private

  def games(team, games)
    left_games         =       games.select { |x| x['team_left_id']  == team.id }
    right_games        =       games.select { |x| x['team_right_id'] == team.id }
    left_win           =  left_games.select { |x| x[@gl] >  x[@gr] }
    right_win          = right_games.select { |x| x[@gl] <  x[@gr] }
    draw               =       games.select { |x| x[@gl] == x[@gr] }
    left_lose          =  left_games.select { |x| x[@gl] <  x[@gr] }
    right_lose         = right_games.select { |x| x[@gl] >  x[@gr] }
    goals1             =     left_games.map { |x| x[@gl] }.sum + right_games.map { |x| x[@gr] }.sum
    goals2             =     left_games.map { |x| x[@gr] }.sum + right_games.map { |x| x[@gl] }.sum
    win_count          = left_win.count + right_win.count
    day_players = @day_players[team.id]
    {
      games_count: games.count,
      opps_win:    opps_map(left_win, right_win).group_by(&:itself),
      opps_draw:   opps_map(draw, draw).reject { |n| n == team.code }.group_by(&:itself),
      opps_lose:   opps_map(left_lose, right_lose).group_by(&:itself),
      win_count:   win_count,
      draw_count:  draw.count,
      lose_count:  left_lose.count + right_lose.count,
      goals:       "#{goals1} : #{goals2}",
      ppg:         (((win_count * 3 + draw.count * 1).to_f / games.count) * 100).to_i.to_f / 100,
      team_code:   team.code,
      before_elo: day_players.map(&:elo).sum.to_i / day_players.count,
      after_elo:  day_players.map(&:new_elo).sum.to_i / day_players.count,
      day_players: day_players
    }
  end

  def opps_map(left, right)
    (left.map(&:team_right_id) + right.map(&:team_left_id)).map { |id| @teams.find { |t| t.id == id }.code }
  end
end
