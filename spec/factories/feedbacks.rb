require 'faker'

FactoryGirl.define do
  chat = FactoryGirl.build(:chat)
  factory :feedback do
    chat_id chat.id
    rating 1
    comment Faker::Lorem.sentence
  end
end
