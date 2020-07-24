require 'rails_helper'

RSpec.describe GameSimilar, type: :model do
  describe "relationships" do
    it { should belong_to :game }
    it { should belong_to :similar }
  end
end
