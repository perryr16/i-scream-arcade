require 'rails_helper'

describe "As a visitor" do
  scenario "I can take a quiz and it will bring me to my recommendations" do
    visit '/quiz'

    click_link "See My Results"
    expect(current_path).to eq('/results')
  end
end
