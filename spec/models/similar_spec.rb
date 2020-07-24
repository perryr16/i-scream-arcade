require 'rails_helper'

RSpec.describe Similar, type: :model do
  describe "relationships" do
    it { should have_many :game_similars }
    it { should have_many(:games).through(:game_similars) }
  end
end
