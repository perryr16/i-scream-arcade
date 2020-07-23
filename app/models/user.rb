class User < ApplicationRecord
  has_many :fear_quizzes
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  validates_presence_of :name, :email, :google_token, :photo
end
