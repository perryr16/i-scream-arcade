class RemoveColumnsFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :title, :string
    remove_column :games, :agg_rating, :float
    remove_column :games, :artworks, :text
    remove_column :games, :follows, :integer
    remove_column :games, :game_modes, :text
    remove_column :games, :hypes, :integer
    remove_column :games, :companies, :text
    remove_column :games, :keywords, :text
    remove_column :games, :multiplayer_modes, :text
    remove_column :games, :player_perspective, :text
    remove_column :games, :rating, :float
    remove_column :games, :rating_count, :float
    remove_column :games, :release_date, :text
    remove_column :games, :screenshots, :text
    remove_column :games, :similar_games, :text
    remove_column :games, :storyline, :string
    remove_column :games, :themes, :text
    remove_column :games, :url, :string
  end
end
