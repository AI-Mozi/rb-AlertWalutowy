FactoryBot.define do
  factory :user, class: User do
    nick { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
