FactoryBot.define do
  factory :user do
    name { Faker::LeagueOfLegends.champion }
    email { Faker::Internet.email }
    password { '12345678' }
    role { 'admin' }
  end
end
