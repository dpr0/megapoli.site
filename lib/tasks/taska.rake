# frozen_string_literal: true

task :delete_season, [:id] => [:environment] do |_, args|
  season = Season.find args[:id]
  days = season.days
  days.each { |day| day.games.each(&:delete) }
  days.each(&:delete)
  DayPlayer.where(season: season).each(&:delete)
  Goal.where(season: season).each(&:delete)

  load 'db/seeds/megapolis7/20260121.rb'
  load 'db/seeds/megapolis7/20260126.rb'
  load 'db/seeds/megapolis7/20260128.rb'
  load 'db/seeds/megapolis7/20260202.rb'
  load 'db/seeds/megapolis7/20260204.rb'
end

task :sort_commands, [:id] => [:environment] do |_, args|
  players = Player.where.not(elo: nil).order(elo: :desc)
  players = players.where(id: args[:id].split(' ')) if args[:id]
  teams_count = 4
  teams = Array.new(teams_count) { [] }
  players.each do |x|
    x.elo = x.day_players.where(season_id: 8).order(id: :desc).last.new_elo
  rescue
  end
  players.sort_by { |x| x.elo }.reverse.each_with_index do |player, index|
    team_index = index / teams_count
    idx = team_index.even? ? (index % teams_count) : (teams_count - 1 - (index % teams_count))
    teams[idx] << player
  end

  teams.each_with_index do |t1, i|
    puts "Команда #{i + 1} - ELO: #{t1.sum { |player| player.elo } / t1.size}"
    t1.each { |player| puts "  #{player.lastname} #{player.name} (#{player.elo})" }
  end
end
