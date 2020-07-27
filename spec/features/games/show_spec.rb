require 'rails_helper'

RSpec.describe "As a user" do
  it "can see a game show page" do
    game1 = create(:game)
    visit "/games/#{game1.id}"

    expect(page).to have_content(game1.title)
    expect(page).to have_content("description of game")
    expect(page).to have_content("Related Games")
  end

  it "can see the average ratings from users" do
    game1 = create(:game)
    create(:review, user_rating: 1, game_id: game1.id)
    create(:review, user_rating: 3, game_id: game1.id)
    create(:review, user_rating: 2, game_id: game1.id)
    create(:review, user_rating: 1, game_id: game1.id)
    create(:review, user_rating: 2, game_id: game1.id)

    visit "/games/#{game1.id}"

    expect(page).to have_content("Average User Rating: 1.8")
  end
end
