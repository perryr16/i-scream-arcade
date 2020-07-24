class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.references :game, foreign_key: true
      t.string :video

      t.timestamps
    end
  end
end
