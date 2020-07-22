class User < ApplicationRecord
  has_many :fear_quizzes
  validates_presence_of :name, :email, :google_token, :photo
end
