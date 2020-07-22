require 'rails_helper'

describe "a User can favorite a game" do

  before :each do 
    @user = create(:user)
    @game1 = create(:game)
    @game2 = create(:game)
    @game3 = create(:game)
    @game4 = create(:game)
  end

  it "from game index page" do
    visit '/games'

    within("#game-#{@game1.id}")do
      find('.btn').click
    end
  end
  
  
end
