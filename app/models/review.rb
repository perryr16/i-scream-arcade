class Review < ApplicationRecord
  belongs_to :game
  validates_presence_of :content, :user_rating
end
