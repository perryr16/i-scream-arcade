class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :age_rating
      t.float :agg_rating
      t.text :artworks, array: true, default: []
      t.integer :category
      t.string :cover
      t.integer :follows
      t.text :game_modes, array: true, default: []
      t.integer :hypes
      t.text :companies, array: true, default: []
      t.text :keywords, array: true, default: []
      t.text :multiplayer_modes, array: true, default: []
      t.text :player_perspective, array: true, default: []
      t.float :popularity
      t.float :rating
      t.integer :rating_count
      t.text :release_date, array: true, default: []
      t.text :screenshots, array: true, default: []
      t.text :similar_games, array: true, default: []
      t.string :storyline
      t.text :themes, array: true, default: []
      t.float :total_rating
      t.string :url
      t.string :video

      t.timestamps
    end
  end
end
