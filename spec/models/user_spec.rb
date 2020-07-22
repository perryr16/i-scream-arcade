require 'rails_helper'

describe User, type: :model do
  describe "relationships" do
    it { should have_many :fear_quizzes }
    it { should have_many :user_games }
    it { should have_many(:games).through(:user_games) }
  end
  
  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :google_token }
    it{ should validate_presence_of :photo }
  end
end
