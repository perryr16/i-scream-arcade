class Game < ApplicationRecord
  #one-many
  has_many :fear_ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :screenshots, dependent: :destroy
  
  #one-one
  has_one :video, dependent: :destroy
  

  #many-many
  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  has_many :game_categories, dependent: :destroy
  has_many :categories, through: :game_categories

  has_many :game_genres, dependent: :destroy
  has_many :genres, through: :game_genres

  has_many :game_keywords, dependent: :destroy
  has_many :keywords, through: :game_keywords

  has_many :game_platforms, dependent: :destroy
  has_many :platforms, through: :game_platforms

  has_many :game_similars, dependent: :destroy
  has_many :similars, through: :game_similars

  has_many :game_themes, dependent: :destroy
  has_many :themes, through: :game_themes


  validates_presence_of :name


end
