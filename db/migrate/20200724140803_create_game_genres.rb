class CreateGameGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :game_genres do |t|
      t.references :game, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
