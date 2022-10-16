class Game < ActiveRecord::Base
    belongs_to :user
    has_many :game_item_cards
    has_many :item_cards, through: :game_item_cards
end