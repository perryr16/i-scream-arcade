class UserGame < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def self.user_game_exists?(game_id, user_id)
    UserGame.find_by(game_id: game_id, user_id: user_id).present?
  end
end
