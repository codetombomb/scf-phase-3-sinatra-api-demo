class CreateItemCardLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :item_card_locations do |t|
      t.integer :item_card_id, null: false, foreign_key: true
      t.integer :location_id, null: false, foreign_key: true
    end
  end
end
