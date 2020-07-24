class Similar < ApplicationRecord
  has_many :game_similars 
  has_many :games, through: :game_similars
end
