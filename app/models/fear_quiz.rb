class FearQuiz < ApplicationRecord
  belongs_to :user
  validates_presence_of :data
end
