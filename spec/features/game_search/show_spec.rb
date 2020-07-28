require 'rails_helper'

describe 'Game Search Show Page' do
  
  xit 'I can see the Search Page title' do
    visit '/'
    choose 'search_type_game'
    fill_in :search, with: "mario party"
    click_button "Search"

    expect(current_path).to eq('/game-search')
    within('.game') do
      expect(page).to have_button('Save Game')
      expect(page).to have_content('Title')
      expect(page).to have_content('Popularity')
      expect(page).to have_content('Themes')
    end
  end

  it "can get game by title" do
    visit '/'
    choose 'search_type_game'
    fill_in 'search', with: 'Super Mario World'
    click_on 'Search'

    summary = "Super Mario World is a jump-and-run platformer and a follow-up to Super Mario Bros. 3. The game retains many of the elements that debuted in Super Mario Bros. 3, such as the world map and Koopaling boss fights, while introducing a large variety of new gameplay mechanics, such as an expanded and less linear world map and the ability to save the game. Much of the game's introduced characters, game mechanics, and artistic themes influenced later titles in the Mario series. The game was released to best-selling status on the SNES, received large amounts of critical acclaim, and is commonly seen on Nintendo's best games of all times on various critic listings."
    expect(page).to have_content(summary)

    expect(page).to have_content('Super Mario World')
    expect(page).to have_css("img[src*='https://images.igdb.com/igdb/image/upload/t_thumb/co23jy.jpg']")    
    expect(page).to have_content("1990")
    expect(page).to have_content('96.0')
    expect(page).to have_content('Crash Bandicoot: The Wrath of Cortex')
    expect(page).to have_content('Big Crown: Showdown')
    expect(page).to have_content('Super Mario Maker 2')
    #and others 
    expect(page).to have_content('Action')
    expect(page).to have_content('Platform')
    expect(page).to have_content('Wii')
    expect(page).to have_content('Super Nintendo Entertainment System (SNES)')
    expect(page).to have_content('Wii U')
    expect(page).to have_content('New Nintendo 3DS')

    click_on 'Crash Bandicoot: The Wrath of Cortex'

    expect(page).to have_content('Crash Bandicoot: The Wrath of Cortex')
    expect(page).to have_content('Released in 2001')
    expect(page).to have_content('Rating: 64.0')
    expect(page).to have_content('Xbox')
    expect(page).to have_content('Havocado')
    


    # expect(page).to have_content('')
  end
  
end