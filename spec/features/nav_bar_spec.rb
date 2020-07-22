require 'rails_helper'

RSpec.describe 'As visitor' do
  describe 'in navigation bar' do
    it 'I can see different links to endpoints' do

      visit "/"

      within 'nav' do
        expect(page).to have_link("Login")
        expect(page).to have_link("Register")
        expect(page).to have_link("Take the Fear Quiz")
      end
    end
  end
end
