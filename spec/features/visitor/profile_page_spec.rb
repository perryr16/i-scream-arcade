require 'rails_helper'

RSpec.describe 'As visitor' do
  describe 'When I visit the profile path' do
    it 'I am redirected to login via Google' do

      visit "/profile"

      within '.masthead' do
        expect(page).to have_content("Log In with Google")
        expect(page).to have_no_content("User Profile")
        expect(page).to have_no_content("Saved Games")
      end
    end
  end
end
