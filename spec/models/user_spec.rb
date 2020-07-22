require 'rails_helper'

describe User, type: :model do
  describe "relationships" do
    it { should have_many :fear_quizzes }
  end
  
  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :google_token }
    it{ should validate_presence_of :photo }
  end
end
