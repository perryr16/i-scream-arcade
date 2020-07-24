class CreateGameThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :game_themes do |t|
      t.references :game, foreign_key: true
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
