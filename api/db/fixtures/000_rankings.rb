require 'faker'
Ranking.seed do |s|
    s.user_name = Faker::Name.unique.name
    s.try_num = rand(1..255)
  end
