FactoryBot.define do
  factory :message do
    message { Faker::Lorem.word }
  end
end