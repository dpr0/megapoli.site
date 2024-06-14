require 'json'

class Common
  file = File.open(ENV['COMMON_LINKS'] || '/home/deploy/megapoli.site/current/app/services/sites.json')
  DATA = JSON.load file
  file.close

  def self.links(height)
    sites.each_with_index.map do |(name, str), index|
      "<a class='btn btn-primary krsz_items' style='bottom: #{index * (height + 10) + 10}px;' href='https://#{name}'><i class='#{str}'></i>&nbsp#{name}</a>"
    end.join
  end

  def self.sites
    DATA
  end
end
