require 'rails_helper'

RSpec.describe "As a user" do
  it "can see a game show page" do
    game1 = create(:game, release_date: 2002, total_rating: 50.5)
    create(:review, user_rating: 1, game_id: game1.id)
    create(:review, user_rating: 2, game_id: game1.id)

    visit "/games/#{game1.id}"

    expect(page).to have_content(game1.name)
    expect(page).to have_content("Released in 2002")
    expect(page).to have_content("Critic's Rating: 50.5")
    expect(page).to have_content("IScream Rating: 1.5")
    expect(page).to have_content("Genres")
    expect(page).to have_content("Themes")
    expect(page).to have_content("Platforms")
    expect(page).to have_content("SIMILAR GAMES")
    expect(page).to have_content("REVIEWS")

  end

  it "can see the average ratings from users" do
    game1 = create(:game)
    create(:review, user_rating: 1, game_id: game1.id)
    create(:review, user_rating: 3, game_id: game1.id)
    create(:review, user_rating: 2, game_id: game1.id)
    create(:review, user_rating: 1, game_id: game1.id)
    create(:review, user_rating: 2, game_id: game1.id)

    visit "/games/#{game1.id}"

    expect(page).to have_content("IScream Rating: 1.8")
  end

  it "can't display ratings if there are none" do
    game1 = create(:game)

    visit "/games/#{game1.id}"

    expect(page).to have_content("Be the first to review.")
  end
end
