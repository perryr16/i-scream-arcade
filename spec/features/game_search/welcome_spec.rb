require 'rails_helper'

describe 'Welcome page game search' do
  before do
    visit '/'
  end

  it 'I can search by game title', :vcr do
    within('.game-search') do
      choose 'search_type_game'
      fill_in :search, with: "Mario Kart 64"
      click_button "Search"
    end
    game = Game.last
    expect(current_path).to eq("/game_search/#{game.id}")
  end

  it "missing fields on sarch return error" do
    click_button "Search"
    expect(current_path).to eq('/')
    expect(page).to have_content('Please Select a Search Type')

    within('.game-search') do
      choose 'search_type_keyword'
      click_button "Search"
    end
    expect(current_path).to eq('/')
    expect(page).to have_content('Please Enter a Valid Search')
  end

  it "invalid name returns error", :vcr do
    within('.game-search') do
      choose 'search_type_game'
      fill_in :search, with: "not a game name 3df34adsf"
      click_button "Search"
    end
  
    expect(current_path).to eq('/')
    expect(page).to have_content("Invalid Game Name")
    
  end

  xit "can bring back games based off of a keyword" do
    within('.game-search') do
      choose 'search_type_keyword'
      fill_in :search, with: "spider"
      click_button "Search"
    end
  end 
  
  
end