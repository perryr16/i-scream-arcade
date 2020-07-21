class FearRating < ApplicationRecord
  belongs_to :game
  validates_presence_of :rating
end
