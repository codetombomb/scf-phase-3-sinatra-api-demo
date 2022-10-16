class ItemCardLocation < ActiveRecord::Base
    belongs_to :item_card
    belongs_to :location
end