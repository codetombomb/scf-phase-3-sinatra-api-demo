class Location < ActiveRecord::Base
    has_many :item_card_locations
    has_many :item_cards, through: :item_card_locations
end