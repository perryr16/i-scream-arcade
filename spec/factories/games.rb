FactoryBot.define do
  factory :game do
    sequence(:title) { |n|"game #{n}" }
    age_rating { 1 }
    agg_rating {rand(1..100)}
    artworks { "MyText" }
    category { "" }
    cover { "https://banner2.cleanpng.com/20180713/xr/kisspng-smiley-ghost-spirit-halloween-clip-art-bad-spirits-5b4924360558c5.9826495615315200540219.jpg" }
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
    sequence(:themes) { |n| ["theme#{n}", "theme#{n+1}"]}
    # themes { [1,2,3]}
    # themes{ ["theme1, theme2"]}
    total_rating { 1.5 }
    url { "MyString" }
    sequence(:video) {|n| "video_url#{n}" }
  end
end
