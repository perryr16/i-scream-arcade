class CreateGamePlatforms < ActiveRecord::Migration[5.2]
  def change
    create_table :game_platforms do |t|
      t.references :game, foreign_key: true
      t.references :platform, foreign_key: true

      t.timestamps
    end
  end
end
