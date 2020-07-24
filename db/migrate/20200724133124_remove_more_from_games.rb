class RemoveMoreFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :category, :integer
    remove_column :games, :video, :string
  end
end
