FactoryBot.define do
  factory :review do
    game
    # game { nil }
    content { Faker::Quote.famous_last_words }
    user_rating { Faker::Number.within(range: 1..100) }
    title { Faker::Movies::HarryPotter.quote }
  end
end
