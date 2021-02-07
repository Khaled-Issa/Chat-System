FactoryBot.define do
  factory :application do
    name { Faker::Lorem.word }
    chat_count { Faker::Number.number(10) }
  end
end