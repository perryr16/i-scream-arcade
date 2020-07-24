require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "relationships" do
    it { should have_many :game_categories }
    it { should have_many(:games).through(:game_categories) }
  end
  
end
