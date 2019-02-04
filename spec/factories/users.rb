FactoryBot.define do
  factory :user do
    nickname { Faker::Witcher.character }
    email { Faker::Internet.email }
    password { "password" }
  end
end
