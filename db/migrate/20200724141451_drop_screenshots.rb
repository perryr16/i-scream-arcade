class DropScreenshots < ActiveRecord::Migration[5.2]
  def change
    drop_table :screenshots
  end
end
