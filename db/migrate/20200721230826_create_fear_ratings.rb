class CreateFearRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :fear_ratings do |t|
      t.references :game, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
