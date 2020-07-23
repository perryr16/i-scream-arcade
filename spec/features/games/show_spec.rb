require 'rails_helper'

RSpec.describe "As a user" do
  it "can see a game show page" do
    game1 = create(:game)
    visit "/games/#{game1.id}"

    expect(page).to have_content("Title of game")
    expect(page).to have_content("description of game")
    expect(page).to have_content("5 Stars")
    expect(page).to have_content("Related Games")
  end  
  
end
