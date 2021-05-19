FactoryBot.define do 
  factory :user_currency, class: UserCurrency do
    user_id {  Faker::Number.between(1, to: 50) }
    currency_id {  Faker::Number.between(1, to: 50) }
    purchase { Faker::Number.between(1.00, to: 5.00) }
    sale { Faker::Number.between(1.00, to: 5.00) }
  end
end