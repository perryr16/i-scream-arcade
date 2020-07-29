require 'rails_helper'

xdescribe "As a visitor" do
  scenario "I can take a quiz and it will bring me to my recommendations" do
    visit '/quiz'

    click_button "See My Results"
    expect(current_path).to eq('/results')
  end
end
