class Game < ApplicationRecord
  has_many :fear_ratings
  has_many :reviews
  has_many :user_games
  has_many :users, through: :user_games
  validates_presence_of :title
end
