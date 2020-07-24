class AddToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :first_release_date, :string
    add_column :games, :name, :string
  end
end
