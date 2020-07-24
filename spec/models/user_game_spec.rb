require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :game}
  end
end
