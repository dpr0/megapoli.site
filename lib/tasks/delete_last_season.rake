# frozen_string_literal: true

task :delete_season, [:id] => [:environment] do |_, args|
  season = Season.find args[:id]
  days = season.days
  days.each { |day| day.games.each(&:delete) }
  days.each(&:delete)
  Stat.where(season: season).each(&:delete)
  DayPlayer.where(season: season).each(&:delete)
  Goal.where(season: season).each(&:delete)
end
