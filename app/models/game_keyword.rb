class GameKeyword < ApplicationRecord
  belongs_to :game
  belongs_to :keyword
end
