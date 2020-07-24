require 'rails_helper'

RSpec.describe Screenshot, type: :model do
  describe "relationships" do
    it { should belong_to :game }
  end
end
