require 'rails_helper'

RSpec.describe GameKeyword, type: :model do
  describe "relationships" do
    it { should belong_to :game }
    it { should belong_to :keyword }
  end
end
