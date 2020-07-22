FactoryBot.define do
  factory :game do
    sequence(:title) { |n|"game #{n}" }
    age_rating { 1 }
    agg_rating {rand(1..100)}
    artworks { "MyText" }
    category { "" }
    cover { "https://i1.pngguru.com/preview/722/34/500/super-mario-icons-super-mario-boo.jpg" }
    follows { 1 }
    game_modes { "MyText" }
    hypes { 1 }
    companies { "MyText" }
    keywords { "MyText" }
    multiplayer_modes { "MyText" }
    player_perspective { "MyText" }
    popularity { rand(1..100)}
    rating { 1.5 }
    rating_count { 1 }
    release_date { "MyText" }
    screenshots { "MyText" }
    similar_games { "MyText" }
    storyline { "MyString" }
    sequence(:themes, (0..10).cycle) { |n| ["theme#{n}", "theme#{n+1}"]}
    # themes{ ["theme1, theme2"]}
    total_rating { 1.5 }
    url { "MyString" }
    video { "video_url" }
  end
end
