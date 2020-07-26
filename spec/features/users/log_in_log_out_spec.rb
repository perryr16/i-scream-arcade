require 'rails_helper'

describe 'As a user I can log in' do
  it 'I can log in through Google OAuth' do
    user = build(:user)
    expect(User.count).to eq(0)

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth',
      :info => {
        name: user.name,
        email: user.email,
        image: user.photo
      },
      :credentials => {
        token: user.google_token
      }
    })

    visit '/'
    within('.navbar') do
      click_link 'Log In with Google'
    end
    expect(page).to have_content("Logged in as #{user.name}")
    expect(current_path).to eq profile_path
    expect(User.count).to eq(1)
  end

  it 'can log out' do
    user = build(:user)
    
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth',
      :info => {
        name: user.name,
        email: user.email,
        image: user.photo
      },
      :credentials => {
        token: user.google_token
      }
    })

    visit '/'

    within('.navbar') do
      click_link 'Log In with Google'
    end

    expect(current_path).to eq profile_path
    
    click_link 'Logout'
    expect(page).to have_content('You have been logged out.')
    expect(current_path).to eq('/')
  
    within('.navbar') do
      expect(page).to have_content('Log In with Google')
    end
  end

  it 'can tell if a user is already in the database' do
    user = create(:user)

    expect(User.count).to eq(1)

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth',
      :info => {
        name: user.name,
        email: user.email,
        image: user.photo
      },
      :credentials => {
        token: user.google_token
      }
    })

    visit '/'

    click_link 'Log In with Google'

    expect(page).to have_content("Logged in as #{user.name}")

    expect(current_path).to eq profile_path

    expect(User.count).to eq(1)
  end
end