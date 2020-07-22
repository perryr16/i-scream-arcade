require 'rails_helper'

RSpec.describe "As a user" do
  it "i can see a game show page" do
    game1 = create(:game)
    visit "/games/#{game1.id}"
  end
end
