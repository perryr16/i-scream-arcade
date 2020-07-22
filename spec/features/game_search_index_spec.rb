require 'rails_helper'

describe 'Game Search Index Page' do
  before do
    visit '/'
    choose 'search_type_keyword'
    fill_in :search, with: "spiders"
    click_button "Search"
  end

  it 'I can see the Search Page title' do
    expect(page).to have_css('.game-search-index')
    expect(page).to have_content('Search Results')
  end

  it 'I can see the returned games and their info' do
    within('.returned-games') do
      expect(page).to have_content('Game Title')
      expect(page).to have_content('Rating')
    end
  end
end