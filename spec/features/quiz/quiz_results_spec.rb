require 'rails_helper'

describe "Fear Quiz" do
  
  it "no values selected" do
    visit '/quiz'

    click_button 'See My Results'

    expect(current_path).to eq('/quiz')
    expect(page).to have_content('Please Tell Me a Fear')
    
  end

  it "slelect 1 value", :vcr do
    visit '/quiz'
    find(:css, "#box20").set(true)

    click_button 'See My Results'

    expect(current_path).to eq('/game_search')

    expect(page).to have_css('.game-img', count: 10)

    expect('98.0').to appear_before('97.0')
    expect('97.0').to appear_before('93.0')
    expect('93.0').to appear_before('92.0')
    expect('92.0').to appear_before('91.0')

    expect(page).to have_content('The Cat Lady')
    cat_lady = Game.find_by(name: 'The Cat Lady')

    within("#game-#{cat_lady.id}") do 
      expect(page).to have_content("98")
      expect(page).to have_content("123")
      expect(page).to have_css("img[src*='#{cat_lady.cover}']")
    end

    expect(page).to have_content('OFF')
    expect(page).to have_content('System Shock: Enhanced Edition')
    expect(page).to have_content('The Last of Us')
    expect(page).to have_content('Castlevania: Symphony of the Night')
    expect(page).to have_content('The Binding of Isaac: Rebirth')
    expect(page).to have_content('Persona 3 Portable')
    expect(page).to have_content('System Shock 2')
    expect(page).to have_content('TimeSplitters 2')
    
    click_on('Silent Hill 2')

    silent_hill = Game.find_by(name: 'Silent Hill 2')
    expect(current_path).to eq(game_path(silent_hill))

    expect(page).to have_content('Silent Hill 2')
    expect(page).to_not have_content('The Cat Lady')

    # horror = '1120'
    
    # cat_keywords = cat_lady.keywords.map(&:keyword)
    # expect(cat_keywords.include?(horror))
    # silent_keywords = silent_hill.keywords.map(&:keyword)
    # expect(silent_keywords.include?(horror))

  end

  it "select many values" , :vcr do
    visit '/quiz'
    find(:css, "#box12").set(true)
    find(:css, "#box24").set(true)
    find(:css, "#box25").set(true)
    find(:css, "#box49").set(true)

    click_button 'See My Results'

    expect(current_path).to eq('/game_search')

    expect(page).to have_css('.game-img', count: 10)
    expect('93.0').to appear_before('91.0')
    expect('91.0').to appear_before('90.0')
    expect('90.0').to appear_before('89.0')

    selected_keywords = ['5406','24080','6919','3855']
    game1 = Game.first
    game2 = Game.last

    # game1_keywords = game1.keywords.map(&:keyword)
    # expect((game1_keywords & selected_keywords).present?).to eq(true)
    # game2_keywords = game2.keywords.map(&:keyword)
    # expect((game2_keywords & selected_keywords).present?).to eq(true)

  end

  it "affraid of 404 errors" do
    visit '/quiz'
    find(:css, "#error_404").set(true)
    find(:css, "#box24").set(true)
    find(:css, "#box25").set(true)
    find(:css, "#box47").set(true)

    click_button 'See My Results'
    expect(current_path).to eq('/quiz_game_search')
    expect(page).to have_content('404')
    expect(page).to have_content('Spooks not found')
    
  end
  
  
  
end
