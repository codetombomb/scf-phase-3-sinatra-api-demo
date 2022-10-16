class CreateGameItemCards < ActiveRecord::Migration[6.1]
  def change
    create_table :game_item_cards do |t|
      t.integer :game_id, null: false, foreign_key: true
      t.integer :item_card_id, null: false, foreign_key: true
    end
  end
end
