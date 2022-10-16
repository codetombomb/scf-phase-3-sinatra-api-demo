class ItemCard < ActiveRecord::Base
    has_many :game_item_cards
    has_many :games, through: :game_item_cards
    has_many :item_card_locations
    has_many :locations, through: :item_card_locations
end