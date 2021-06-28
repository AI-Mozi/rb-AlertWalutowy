FactoryBot.define do
  factory :currency, class: Currency do
    name { Faker::Currency.name }
    value { Faker::Number.between(from: 1.00, to: 10.00) }
    code  { Faker::Currency.code }
  end
end