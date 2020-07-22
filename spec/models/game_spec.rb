require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "relationships" do
    it { should have_many :fear_ratings }
    it { should have_many :reviews }
    it { should have_many :user_games }
    it { should have_many(:users).through(:user_games) }

  end
  
  describe "validations" do
    it{ should validate_presence_of :title }
  end
end
