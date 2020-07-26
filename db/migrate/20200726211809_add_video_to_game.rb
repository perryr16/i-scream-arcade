class AddVideoToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :video, :string
  end
end
