FactoryBot.define do
  factory :review do
    game { nil }
    content { "MyString" }
    user_rating { 1 }
  end
end
