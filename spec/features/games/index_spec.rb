require 'rails_helper'

describe "From Game Index" do

  before :each do 
    @user = create(:user)
    @game1 = create(:game)
    @game2 = create(:game)
    @game3 = create(:game)
    @game4 = create(:game)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end

  it "can click a game title link and end on game show page " do
    visit games_path

    within("#game-#{@game2.id}")do
      click_on @game2.title
    end

    expect(current_path).to eq(game_path(@game2))
  end
  
end
