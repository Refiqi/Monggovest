FactoryBot.define do
  factory :user_investor do
    user_id { Faker::Number.digit }
    product_invests_id { Faker::Number.digit }
    investor_slot { Faker::Number.between(2, 20) }
    investor_pay { Faker::Number.number(10) }
    invest_year { Faker::Number.digit }
    created_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end