require 'rails_helper'

RSpec.describe GameGenre, type: :model do
  describe "relationships" do
    it { should belong_to :game }
    it { should belong_to :genre }
  end
end
