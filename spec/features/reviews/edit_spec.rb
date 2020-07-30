require 'rails_helper'

describe "Editing Reviews" do
  before :each do
    @game = create(:game)
    @user = create(:user)
    @review = create(:review, content: "So much fun.", game_id: @game.id, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "User can update their review" do
    visit "/games/#{@game.id}"

    click_on "Edit"

    expect(current_path).to eq("/games/#{@game.id}/reviews/#{@review.id}")
  end
end
