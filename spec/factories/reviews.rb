FactoryBot.define do
  factory :review do
    game
    # game { nil }
    content { "MyString" }
    user_rating { 1 }
    title { Faker::Movies::HarryPotter.quote }
  end
end
