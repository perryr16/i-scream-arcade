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

  it "invalid keyword returns error", :vcr do
    within('.game-search') do
      choose 'search_type_keyword'
      fill_in :search, with: "gfjskdog"
      click_button "Search"
    end
  
    expect(current_path).to eq('/')
    expect(page).to have_content("Invalid Keyword")
  end

  it "can bring back games based off of a keyword", :vcr do
    within('.game-search') do
      choose 'search_type_keyword'
      fill_in :search, with: "spider"
      click_button "Search"
      expect(current_path).to eq('/game_search') 
    end

    within('.search-results') do
      skyrim = Game.find_by(name: "The Elder Scrolls V: Skyrim")
      # binding.pry
      expect(page).to have_content("The Elder Scrolls V: Skyrim")
      within("#game-#{skyrim.id}") do 
      expect(page).to have_content("91")
      expect(page).to have_content("34")
      expect(page).to have_css("img[src*='#{skyrim.cover}']")
      end
    end  
    expect(page).to have_content('The Binding of Isaac: Rebirth')
    expect(page).to have_content('System Shock 2')
    expect(page).to have_content('Wasteland')
    expect(page).to have_content('Metal Gear Solid 3: Snake Eater')
    expect(page).to have_content('Rayman Legends')
    expect(page).to have_content('Sanitarium')
    expect(page).to have_content('Ori and the Blind Forest')

    within('.game-search') do
      choose 'search_type_keyword'
      fill_in :search, with: "tom nook"
      click_button "Search"
      expect(current_path).to eq('/game_search') 
    end

    within('.search-results') do
      nook = Game.find_by(name: "Animal Crossing")
      # binding.pry
      expect(page).to have_content("Animal Crossing")
      within("#game-#{nook.id}") do 
      # expect(page).to have_content("91")
      # expect(page).to have_content("34")
      expect(page).to have_css("img[src*='#{nook.cover}']")
      end
    end
  end
end