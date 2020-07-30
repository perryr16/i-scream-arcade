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

    within ".reviews-#{@review.id}" do
      expect(page).to have_content("So much fun")
      click_link "Edit"
    end

    expect(current_path).to eq("/games/#{@game.id}/#{@review.id}/edit")

    fill_in :title, with: @review.title
    fill_in :content, with: "What are they feeding these pets?!"
    fill_in :user_rating, with: 2

    click_on "Update"

    expect(current_path).to eq("/games/#{@game.id}")
    expect(page).to have_content("What are they feeding these pets?!")
  end
end
