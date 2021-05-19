FactoryBot.define do
  factory :bid_ask_currency, class: BidAskCurrency do
    currency_id { Faker::Number.between(1, to: 50) }
    bid { Faker::Number.between(1.00, to: 5.00) }
    ask { Faker::Number.between(1.00, to: 5.00) }
  end
end