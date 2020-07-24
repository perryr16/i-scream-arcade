class CreateGameKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :game_keywords do |t|
      t.references :game, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
