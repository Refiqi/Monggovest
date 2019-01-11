FactoryBot.define do
    factory :product_invest do
      product_id { Faker::Number.digit }
      slot { Faker::Number.between(2, 20) }
      price { Faker::Number.number(10) }
      count_view { Faker::Number.digit }
    end
  end