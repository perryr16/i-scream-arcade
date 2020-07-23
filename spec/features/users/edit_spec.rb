require 'rails_helper'

describe "user show page" do

  before :each do 
    @user = create(:user, name: "name1", email: "email@email.com", photo: "https://ftnj.com/wp-content/uploads/2018/09/female-headshot-silhouette.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user can get to edit page" do
    visit '/profile'

    within(".user-info")do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.email)
    end

    within(".user-photo")do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(@user))
  end

end
