class CreateSimilars < ActiveRecord::Migration[5.2]
  def change
    create_table :similars do |t|
      t.string :games

      t.timestamps
    end
  end
end
