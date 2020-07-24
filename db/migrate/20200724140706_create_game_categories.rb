class CreateGameCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :game_categories do |t|
      t.references :game, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
