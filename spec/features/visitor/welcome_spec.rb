require 'rails_helper'

describe 'Visitor Welcome Page' do
  before do
     visit '/'
  end

  it 'I can see the I Scream Aracade title' do
    expect(page).to have_css('.masthead')
    expect(page).to have_content('I Scream Arcade')
  end

  it 'I can click button to take Fear Quiz' do
    within('.fear-quiz') do
      expect(page).to have_content('Will it Scare Me?')
      expect(page).to have_content('Take the Fear Quiz')
      click_on('Will it Scare Me?')
      expect(current_path).to eq('/quiz')
      save_and_open_page
    end
  end

  it 'I can search by game title or keyword' do
    within('.game-search') do
    expect(page).to have_content('Search for Games')
    end
  end
end