class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :google_token
      t.string :email
      t.string :photo, default: 'https://ftnj.com/wp-content/uploads/2018/09/female-headshot-silhouette.jpg'

      t.timestamps
    end
  end
end
