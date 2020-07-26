require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "relationships" do
    it { should belong_to :game }
  end

  describe "validations" do
    it{ should validate_presence_of :content }
    it{ should validate_presence_of :user_rating }
    it{ should validate_presence_of :title}
  end
end
