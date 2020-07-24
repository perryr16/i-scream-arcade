class AddColumnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :total_rating, :float
  end
end
