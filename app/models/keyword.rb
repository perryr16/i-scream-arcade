class Keyword < ApplicationRecord
  has_many :game_keywords
  has_many :games, through: :game_keywords
end
