require 'faker'
Ranking.seed do |s|
    s.username = Faker::Name.unique.name
    s.trynum = rand(1..255)
  end
