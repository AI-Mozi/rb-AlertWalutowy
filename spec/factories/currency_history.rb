FactoryBot.define do
  factory :currency_history, class: CurrencyHistory do
    currency_id { Faker::Number.between(1, to: 50) }
    mid { Faker::Number.between(1.00, to: 50.00) }
    day { Faker::Date.between(from: '2010-09-23', to: '2020-09-25') }
  end
end