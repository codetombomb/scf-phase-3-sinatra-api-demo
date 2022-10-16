class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :user_id #Can play game without having to login
      t.boolean :complete, default: false
      t.integer :moves
      t.integer :wrong_moves
      t.string :difficulty
      t.integer :total_time_seconds
    end
  end
end
