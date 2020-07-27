require 'rails_helper'

RSpec.describe "As a user" do
  it "can see a game show page" do
    game1 = create(:game)
    visit "/games/#{game1.id}"

    expect(page).to have_content(game1.title)
    expect(page).to have_content("description of game")
    expect(page).to have_content("Rating: #{game1.rating}")
    expect(page).to have_content("Related Games")
  end  
  
end
