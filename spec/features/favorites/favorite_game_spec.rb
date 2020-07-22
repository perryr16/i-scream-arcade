require 'rails_helper'

describe "a User can favorite a game" do

  before :each do 
    @user = create(:user)
    @game1 = create(:game)
    @game2 = create(:game)
    @game3 = create(:game)
    @game4 = create(:game)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end

  it "from game index page" do
    visit '/games'

    within("#game-#{@game1.id}")do
      click_on "Favorite"
    end

    expect(page).to have_content("You have added #{@game1.title} to your favorites")

  end
  
  
end
