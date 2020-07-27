require 'rails_helper'

describe "When a user visits a game's show page" do
  before :each do
    @game = create(:game)
  end

  it "User can click on link to fill out review" do
    visit "/games/#{@game.id}"
    click_link "Write a Review"

    expect(current_path).to eq("/games/#{@game.id}/review")
  end

  it "User can write a new review for a game" do
    visit "/games/#{@game.id}/review"

    fill_in :title, with: 'If you like speed and innocent characters'
    fill_in :user_rating, with: 4
    fill_in :content, with: 'I have never left a place with so many scratches.'

    click_on "Submit"

    expect(current_path).to eq("/games/#{@game.id}")
    expect(page).to have_content("Your Review Has Been Added")
  end

  it "User cannot submit review if all fields are not filled in" do
    visit "/games/#{@game.id}/review"

    fill_in :title, with: ""
    fill_in :user_rating, with: 4
    fill_in :content, with: 'I have never left a place with so many scratches.'

    click_on "Submit"

    expect(page).to have_content("Title can't be blank")
  end
end
