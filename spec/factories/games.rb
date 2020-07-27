FactoryBot.define do
  factory :game do
    age_rating { 1 }
    cover { "https://banner2.cleanpng.com/20180713/xr/kisspng-smiley-ghost-spirit-halloween-clip-art-bad-spirits-5b4924360558c5.9826495615315200540219.jpg" }
    popularity { rand(91..100)}
    total_rating { rand(1..10) }
    sequence(:summary) {|n| "Summary #{n}"}
    first_release_date { rand(1990..2020) }
    sequence(:name) { |n|"game #{n}" }
  end
end
