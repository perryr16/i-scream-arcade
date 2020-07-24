require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe "relationships" do
    it { should have_many :game_keywords }
    it { should have_many(:games).through(:game_keywords) }
  end
end
