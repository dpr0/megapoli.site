# frozen_string_literal: true

Team.create(code: 'purple', name: 'Фиолетовые', num: 1)
Team.create(code: 'green',  name: 'Зеленые',    num: 2)
Team.create(code: 'white',  name: 'Белые',      num: 3)
Team.create(code: 'color1', name: 'Цветные1',   num: 4)
Team.create(code: 'black',  name: 'Черные',     num: 5)
Team.create(code: 'orange', name: 'Оранжевые',  num: 6)

Role.create(code: 'admin',   name: 'Администратор')
Role.create(code: 'captain', name: 'Капитан команды')
Role.create(code: 'player',  name: 'Игрок')

sport      = Sport.create(code: 'football', name: 'Футбол')
megapolis  = sport.championships.create(code: 'megapolis',  name: 'Мегаполис')
sbermarket = sport.championships.create(code: 'sbermarket', name: 'Сбермаркет')

load File.join(Rails.root, 'db', 'seeds', 'players.rb')
s1 =  megapolis.seasons.create(code: 'megapolis1',  name: '2020/1')
s2 =  megapolis.seasons.create(code: 'megapolis2',  name: '2020/2')
s3 =  megapolis.seasons.create(code: 'megapolis3',  name: '2021/1')
s4 =  megapolis.seasons.create(code: 'megapolis4',  name: '2021/2')
s5 =  megapolis.seasons.create(code: 'megapolis5',  name: '2022/1')
s6 =  megapolis.seasons.create(code: 'megapolis6',  name: '2024/2')
s6 = sbermarket.seasons.create(code: 'sbermarket1', name: '2022/1')
s7 =  megapolis.seasons.create(code: 'megapolis7',  name: '2026/1')

Season.all.each do |season|
  puts "\n< #{season.code.capitalize}: #{season.name} > ==================================================="
  @season_id = season.id
  Dir[File.join(Rails.root, 'db', 'seeds', season.code, '*.rb')].each { |seed| load(seed) }
  season.update(active: false) unless [7].include? @season_id
  season.update_stats!
end
