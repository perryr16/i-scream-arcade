class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user, required: true
  validates_presence_of :content, :user_rating, :title
end
