class ChangeColumnInSimilars < ActiveRecord::Migration[5.2]
  def change
    rename_column :similars, :games, :game
  end
end
