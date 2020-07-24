require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "relationships" do
    it { should have_many :game_genres }
    it { should have_many(:games).through(:game_genres) }
  end
end
