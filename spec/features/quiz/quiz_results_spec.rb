require 'rails_helper'

describe "Fear Quiz" do
  
  xit "no values selected" do
    visit '/quiz'

    click_button 'See My Results'

    expect(current_path).to eq('/quiz')
    expect(page).to have_content('Please Tell Me a Fear')
    
  end

  it "slelect 1 value", :vcr do
    visit '/quiz'
    find(:css, "#box22").set(true)

    click_button 'See My Results'

    expect(current_path).to eq('/game_search')
    save_and_open_page

    expect(page).to have_css('.game-img', count: 10)
    expect(page).to have_content('adf45678fgh')


    
  end

  xit "select many values" do

  end
  
  
end
