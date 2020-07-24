require 'rails_helper'

RSpec.describe GameTheme, type: :model do
  describe "relationships" do
    it { should belong_to :game }
    it { should belong_to :theme }
  end
end
