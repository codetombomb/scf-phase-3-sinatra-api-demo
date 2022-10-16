class GameItemCard < ActiveRecord::Base
    belongs_to :game
    belongs_to :item_card
end