require 'rails_helper'

describe 'Welcome page game search' do
  before do
    visit '/'
  end

  it 'I can search by game title' do
    within('.game-search') do
      choose 'search_type_keyword'
      fill_in :search, with: "spiders"
      click_button "Search"
    end
    expect(current_path).to eq "/game-search"
    expect(page).to have_content("Search Results")
  end

  it 'I can search by game title' do
    within('.game-search') do
      choose 'search_type_game'
      fill_in :search, with: "mario party"
      click_button "Search"
    end
    expect(current_path).to eq "/game-search"
  end
end