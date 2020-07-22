class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :game, foreign_key: true
      t.string :content
      t.integer :user_rating

      t.timestamps
    end
  end
end
