require 'rails_helper'

RSpec.describe GameCategory, type: :model do
  describe "relationships" do
    it { should belong_to :game }
    it { should belong_to :category }
  end
end
