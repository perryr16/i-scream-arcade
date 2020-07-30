require 'rails_helper'

describe "Delete review" do
  before :each do
    @game = create(:game)
    @user = create(:user)
    @review = create(:review, content: "So much fun.", game_id: @game.id, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "User can delete their own review" do
    visit "/games/#{@game.id}"

    within ".reviews-#{@review.id}" do
      expect(page).to have_content(@review.content)
      click_button "Delete"
    end

    expect(current_path).to eq("/games/#{@game.id}")
    expect(page).to_not have_content(@review.content)
  end
end
