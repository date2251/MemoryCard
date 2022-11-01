FactoryBot.define do
  factory :ranking do
    user_name { Faker::Name.unique.name }
    try_num { rand(1..255) }
  end
end
