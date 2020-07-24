require 'rails_helper'

describe 'Game Search Show Page' do
  before do
    visit '/'
    choose 'search_type_game'
    fill_in :search, with: "mario party"
    click_button "Search"
  end

  it 'I can see the Search Page title' do
    expect(current_path).to eq('/game-search')
    within('.game') do
      expect(page).to have_button('Save Game')
      expect(page).to have_content('Title')
      expect(page).to have_content('Popularity')
      expect(page).to have_content('Themes')
    end
  end
end