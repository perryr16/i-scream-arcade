require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "relationships" do
    it { should have_many :fear_ratings }
    it { should have_many :reviews }
    it { should have_many :screenshots }

    it { should have_one :video }
   
    it { should have_many :user_games }
    it { should have_many(:users).through(:user_games) }
    it { should have_many :game_categories }
    it { should have_many(:categories).through(:game_categories) }
    it { should have_many :game_genres }
    it { should have_many(:genres).through(:game_genres) }
    it { should have_many :game_keywords }
    it { should have_many(:keywords).through(:game_keywords) }
    it { should have_many :game_platforms }
    it { should have_many(:platforms).through(:game_platforms) }
    it { should have_many :game_similars }
    it { should have_many(:similars).through(:game_similars) }
    it { should have_many :game_themes }
    it { should have_many(:themes).through(:game_themes) }


  end
  
  describe "validations" do
    it{ should validate_presence_of :name }
  end
end
