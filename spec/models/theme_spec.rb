require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "relationships"do
    it { should have_many :game_themes }
    it { should have_many(:games).through(:game_themes) }
  end
end
