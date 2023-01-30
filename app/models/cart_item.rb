class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    def add_price_tax
    (self.price*1.10).round
    end
    def subtotal
        item.add_price_tax*amount
    end
end
