# frozen_string_literal: true

task :delete_day, [:id] => [:environment] do |_, args|
  day = Day.find_by(id: args[:id])
  day.games.each { |game| game.goals.delete_all }
  day.day_players.delete_all
  day.games.delete_all
  day.destroy
end

task :delete_season, [:id] => [:environment] do |_, args|
  s = Season.find args[:id]
  days = s.days
  days.each { |day| day.games.delete_all }
  days.delete_all
  DayPlayer.where(season: s).delete_all
  Goal.where(season: s).delete_all

  load 'db/seeds/megapolis7/20260121.rb'
  load 'db/seeds/megapolis7/20260126.rb'
  load 'db/seeds/megapolis7/20260128.rb'
  load 'db/seeds/megapolis7/20260202.rb'
  load 'db/seeds/megapolis7/20260204.rb'
  load 'db/seeds/megapolis7/20260209.rb'
  load 'db/seeds/megapolis7/20260211.rb'
  load 'db/seeds/megapolis7/20260216.rb'
  load 'db/seeds/megapolis7/20260218.rb'
  load 'db/seeds/megapolis7/20260223.rb'
  load 'db/seeds/megapolis7/20260225.rb'
  load 'db/seeds/megapolis7/20260302.rb'
  load 'db/seeds/megapolis7/20260304.rb'
  load 'db/seeds/megapolis7/20260309.rb'
  load 'db/seeds/megapolis7/20260311.rb'
  load 'db/seeds/megapolis7/20260316.rb'
  load 'db/seeds/megapolis7/20260318.rb'
  load 'db/seeds/megapolis7/20260323.rb'
  load 'db/seeds/megapolis7/20260325.rb'
  load 'db/seeds/megapolis7/20260330.rb'
  load 'db/seeds/megapolis7/20260401.rb'
  load 'db/seeds/megapolis7/20260427.rb'
  load 'db/seeds/megapolis7/20260429.rb'
  load 'db/seeds/megapolis7/20260506.rb'
  load 'db/seeds/megapolis7/20260513.rb'
  load 'db/seeds/megapolis7/20260518.rb'
  load 'db/seeds/megapolis7/20260601.rb'
end

task :sort_commands, [:id] => [:environment] do |_, args|
  players = Player.where.not(elo: nil).order(elo: :desc)

  players = players.where(id: args[:id].split(' ')) if args[:id]
  teams_count = 4
  players_per_team = 6

  day_players = DayPlayer.where(season_id: 8).group_by(&:player_id)
  teams2 = Array.new(teams_count) { [] }
  teams = Array.new(teams_count) { { players: [], total_elo: 0 } }

  players.each do |x|
    x.elo = day_players[x.id].max_by(&:day_id).new_elo
  rescue Exception => e
  end
  avg = players.sum(&:elo)/players.size
  puts "Average ELO: #{avg}"
  sorted_players = players.sort_by { |player| -player[:elo] }
  sorted_players.each_with_index do |player, index|
    team_index = index / teams_count
    team_index = index % teams_count if team_index.even?
    team_index = teams_count - 1 - (index % teams_count) if team_index.odd?
    teams[team_index][:players] << player[:id]
    teams[team_index][:total_elo] += player[:elo]
  end
  players.sort_by { |x| x.elo }.reverse.each_with_index do |player, index|
    team_index = index / teams_count
    idx = team_index.even? ? (index % teams_count) : (teams_count - 1 - (index % teams_count))
    # idx = index % teams_count
    teams2[idx] << player
  end
  # byebug

  ar2 = []
  teams2.each_with_index do |t1, i|
    puts "Команда #{i + 1} - ELO: #{t1.sum { |player| player.elo } / t1.size}"
    ar2 << "#{i+1} => [#{t1.map { |pl| pl.id }.join(', ')}],"
    t1.each { |player| puts "#{player.id} - #{player.lastname} #{player.name} (#{player.elo})" }
  end
  puts ar2
end

task :calc_elo, [:id] => [:environment] do |_, args|
  players = Player.where.not(elo: nil).order(elo: :desc).to_a
  day_players = DayPlayer.where(season_id: 8).group_by(&:player_id)
  players.each do |x|
    x.elo = day_players[x.id].max_by(&:day_id).new_elo
  rescue Exception => e
  end
  {
    1 => [2, 5, 94, 18, 29, 14, 115],
    2 => [13, 4, 6, 110, 7, 58, 10],
    3 => [21, 19, 93, 95, 44, 50],
    4 => [109, 104, 112, 54, 60, 62],

    # 1 => [18, 19, 93, 62, 115, 112, 44],
    # 2 => [13, 110, 95, 5, 60, 50, 14],
    # 3 => [54, 4, 6, 94, 58, 7],
    # 4 => [2, 29, 104, 10, 21, 109],
  }.each do |team_id, players_ids|
    t1 = players.select { |x| players_ids.include? x.id }.sort_by { |player| -player[:elo] }
    puts "Команда #{team_id} - ELO: #{t1.sum { |player| player.elo } / t1.size}"
    t1.each { |player| puts "#{player.id} - #{player.lastname} #{player.name} (#{player.elo})" }
  end
end
