require 'rails_helper'

describe "user show page" do

  before :each do 
    @user = create(:user)
    @user2 = create(:user, name: "name2", email: "email@email.com", photo: "photo.url")
    @game1 = create(:game)
    @game2 = create(:game)
    @game3 = create(:game)
    @game4 = create(:game)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user show page has personal info" do
    visit '/profile'

    expect(page).to_not have_content(@user.google_token)

    within(".user-info")do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.email)
      expect(page).to_not have_content(@user2.name)
      expect(page).to_not have_content(@user2.email)
    end

    within(".user-photo")do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    within(".my-games")do
    end

  end

  xit "if a visitior tries to access a profile page it is a 404" do
  end
  

end