require 'rails_helper'

describe 'Game Search Index Page' do
  before do
    visit '/'
    choose 'search_type_keyword'
    fill_in :search, with: "spiders"
    click_button "Search"
  end

  it 'I can see the Search Page title' do
    within('.search-results') do
    expect(page).to have_content('Save Games')
    expect(page).to have_content('Title')
    expect(page).to have_content('Rating')
    expect(page).to have_content('Popularity')
    end
  end
end