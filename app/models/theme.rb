class Theme < ApplicationRecord
  has_many :game_themes
  has_many :games, through: :game_themes
end
