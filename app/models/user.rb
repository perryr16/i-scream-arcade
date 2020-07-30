class User < ApplicationRecord
  has_many :fear_quizzes
  has_many :reviews
  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games
  validates_presence_of :name, :email, :google_token, :photo

  def self.from_omniauth(auth)
    find_or_create_by(email: auth.info.email) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.photo = auth.info.image
      user.google_token = auth.credentials.token
    end
  end
end
