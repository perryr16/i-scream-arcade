class CreateScreenshots < ActiveRecord::Migration[5.2]
  def change
    create_table :screenshots do |t|
      t.references :game, foreign_key: true
      t.string :screenshot

      t.timestamps
    end
  end
end
