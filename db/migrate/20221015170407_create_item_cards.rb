class CreateItemCards < ActiveRecord::Migration[6.1]
  def change
    create_table :item_cards do |t|
      t.string :image_url
      t.integer :compendium_id
      t.string :name
      t.string :description
    end
  end
end
