FactoryBot.define do
  factory :user, class: User do
    nick { Faker::Internet.password(min_length: 4, max_length: 10)}
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
