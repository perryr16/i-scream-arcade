class Game < ApplicationRecord
  has_many :fear_ratings
  has_many :reviews
  validates_presence_of :title
end
