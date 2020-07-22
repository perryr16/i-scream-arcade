require 'rails_helper'

describe "a User can add a game to 'my games'" do

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
      click_on "Add to My Games"
    end

    expect(current_path).to eq(games_path)
    expect(page).to have_content("You have added #{@game1.title} to Your Games")
    
    within("#game-#{@game1.id}")do
    click_on "Add to My Games"
  end
  
    expect(current_path).to eq(games_path)
    expect(page).to have_content("You have already added #{@game1.title} to Your Games")
    
    within("#game-#{@game4.id}")do
      click_on "Add to My Games"
    end

    expect(page).to have_content("You have added #{@game4.title} to Your Games")

  end
  
  
end
