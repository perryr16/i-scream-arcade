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
    expect(@user.games).to eq([])

    within("#game-#{@game1.id}")do
      find('.save-game').click
    end

    expect(current_path).to eq(games_path)
    expect(page).to have_content("You have added #{@game1.title} to Saved Games")
    
    within("#game-#{@game1.id}")do
      find('.save-game').click
    end
  
    expect(current_path).to eq(games_path)
    expect(page).to have_content("You have already added #{@game1.title} to Saved Games")
    
    within("#game-#{@game4.id}")do
      find('.save-game').click
    end

    expect(page).to have_content("You have added #{@game4.title} to Saved Games")

    @user.reload
    @game1.reload
    @game2.reload
    @game4.reload
    expect(@user.games).to eq([@game1, @game4])
    expect(@game1.users).to eq([@user])
    expect(@game2.users).to eq([])
    expect(@game4.users).to eq([@user])

  end
  
  
end
