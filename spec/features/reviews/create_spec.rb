require 'rails_helper'

describe "When a user visits a game's show page" do
  it "User can click on link to fill out review" do
    game = create(:game)

    visit "/games/#{game.id}"
    click_link "Write a Review"

    expect(current_path).to eq("/games/#{game.id}/review")
  end
end
