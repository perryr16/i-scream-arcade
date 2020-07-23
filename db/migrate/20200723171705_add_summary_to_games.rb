class AddSummaryToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :summary, :string
  end
end
