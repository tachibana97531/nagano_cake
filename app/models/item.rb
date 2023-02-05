class Item < ApplicationRecord
    has_one_attached:image
    
    def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [width, height]).processed
    end
    
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    
    def add_price_tax
    (self.price*1.10).round
    end
    
    def self.looks(search, word)
      if search == "perfect_match"
        @item = Item.where("name LIKE?", "#{word}")
      elsif search == "forward_match"
        @item = Item.where("name LIKE?","#{word}%")
      elsif search == "backward_match"
        @item = Item.where("name LIKE?","%#{word}")
      elsif search == "partial_match"
        @item = Item.where("name LIKE?","%#{word}%")
      else
        @item = Item.all
      end
    end
end
