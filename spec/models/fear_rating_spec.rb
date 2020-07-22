require 'rails_helper'

RSpec.describe FearRating, type: :model do
  describe "relationships" do
    it { should belong_to :game }
  end
  
  describe "validations" do
    it{ should validate_presence_of :rating }
  end
end
