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

  it "can edit profile when all fields are filled out" do
    visit edit_user_path(@user)

    photo_url =  "https://cdn.science101.com/wp-content/uploads/2018/08/smart-beagle-810x608-1535480926636.jpg"

    fill_in "user[name]", with: "Dog Bark"
    fill_in "user[email]", with: "pup@woof.com"
    fill_in "user[photo]", with: photo_url 

    click_on "Update Profile"

    expect(current_path).to eq('/profile')
    expect(page).to have_content("You have updated your profile")
    
    within(".user-info")do
      expect(page).to have_content("Dog Bark")
      expect(page).to have_content("pup@woof.com")
      expect(page).to_not have_content("name1")
      expect(page).to_not have_content("email@email.com")
    end

    within(".user-photo")do
      expect(page).to have_css("img[src*='#{photo_url}']")
      expect(page).to_not have_css("img[src*='https://ftnj.com/wp-content/uploads/2018/09/female-headshot-silhouette.jpg']")
    end
  end

    it "can edit profile when all fields are filled out" do
    visit edit_user_path(@user)

    photo_url =  "https://cdn.science101.com/wp-content/uploads/2018/08/smart-beagle-810x608-1535480926636.jpg"

    fill_in "user[name]", with: "Dog Bark"
    fill_in "user[email]", with: "pup@woof.com"
    fill_in "user[photo]", with: photo_url 

    click_on "Update Profile"

    expect(current_path).to eq('/profile')
    expect(page).to have_content("You have updated your profile")
    
    within(".user-info")do
      expect(page).to have_content("Dog Bark")
      expect(page).to have_content("pup@woof.com")
      expect(page).to_not have_content("name1")
      expect(page).to_not have_content("email@email.com")
    end

    within(".user-photo")do
      expect(page).to have_css("img[src*='#{photo_url}']")
      expect(page).to_not have_css("img[src*='https://ftnj.com/wp-content/uploads/2018/09/female-headshot-silhouette.jpg']")
    end
  end
  

end
