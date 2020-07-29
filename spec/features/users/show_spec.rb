require 'rails_helper'

describe "user show page" do

  before :each do
    @user = create(:user)
    @user2 = create(:user, name: "name2", email: "email@email.com", photo: "photo.url")
    @game1 = create(:game, total_rating: 98, popularity: 110)
    @game2 = create(:game, total_rating: 99, popularity: 118)
    @game3 = create(:game, total_rating: 101, popularity: 119)
    @game4 = create(:game, total_rating: 97, popularity: 117)
    @user.games << @game1
    @user.games << @game2
    @user.games << @game4
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

    within(".profile-game-list")do
      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game1.total_rating)
      expect(page).to have_content(@game1.popularity)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game2.total_rating)
      expect(page).to have_content(@game2.popularity)
      expect(page).to have_content(@game4.name)
      expect(page).to have_content(@game4.total_rating)
      expect(page).to have_content(@game4.popularity)

      expect(page).to_not have_content(@game3.name)
      expect(page).to_not have_content(@game3.total_rating)
      expect(page).to_not have_content(@game3.popularity)
    end

  end

  it "User clicks the controller and the game is removed from saved games" do
    visit '/profile'

    within(".profile-game-list")do
      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game2.name)
      expect(page).to have_content(@game4.name)
    end

    within("#game-#{@game2.id}") do
      find('.unsave-game').click
    end

    @user.reload

    expect(current_path).to eq('/profile')
    expect(page).to have_content("You have removed #{@game2.name} from Saved Games")
    visit ('/profile')

    within(".profile-game-list")do
      expect(page).to have_content(@game1.name)
      expect(page).to have_content(@game4.name)
      expect(page).to_not have_content(@game2.name)
    end
  end

  it "can click a game name link and end on game show page " do
    visit '/profile'

    within("#game-#{@game2.id}")do
      click_on @game2.name
    end

    expect(current_path).to eq(game_path(@game2))
  end

  it "can display a message if there are no saved games" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/profile'

    expect(page).to have_content("You have not saved any games")
  end
end
