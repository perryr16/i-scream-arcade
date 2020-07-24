class GameTheme < ApplicationRecord
  belongs_to :game
  belongs_to :theme
end
