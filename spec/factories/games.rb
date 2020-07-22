FactoryBot.define do
  factory :game do
    title { "MyString" }
    age_rating { 1 }
    agg_rating { 1.5 }
    artworks { "MyText" }
    category { "" }
    cover { "MyString" }
    follows { 1 }
    game_modes { "MyText" }
    hypes { 1 }
    companies { "MyText" }
    keywords { "MyText" }
    multiplayer_modes { "MyText" }
    player_perspective { "MyText" }
    popularity { 1.5 }
    rating { 1.5 }
    rating_count { 1 }
    release_date { "MyText" }
    screenshots { "MyText" }
    similar_games { "MyText" }
    storyline { "MyString" }
    themes { "MyText" }
    total_rating { 1.5 }
    url { "MyString" }
    video { "MyString" }
  end
end
