class CreateFearQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :fear_quizzes do |t|
      t.references :user, foreign_key: true, default: nil
      t.text :data

      t.timestamps
    end
  end
end
