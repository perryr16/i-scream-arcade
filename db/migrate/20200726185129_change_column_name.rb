class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :first_release_date, :release_date
  end
end
