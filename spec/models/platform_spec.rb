require 'rails_helper'

RSpec.describe Platform, type: :model do
  describe "relationships" do
    it { should have_many :game_platforms }
    it { should have_many(:games).through(:game_platforms) }
  end
end
