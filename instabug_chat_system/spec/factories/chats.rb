FactoryBot.define do
  factory :chat do
    messages_count { Faker::Number.number(10) }
    application_id { Faker::Number.number(10) }
  end
end