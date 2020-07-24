class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_categories
    drop_table :game_genres
    drop_table :game_keywords
    drop_table :game_platforms
    drop_table :game_similars
    drop_table :game_themes

    
  end
end
