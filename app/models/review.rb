class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user, required: true
  validates_presence_of :content, :user_rating, :title
  validates :user_id, :uniqueness => { :scope => :review_id,
    :message => "You may only write one review per game." }
end
