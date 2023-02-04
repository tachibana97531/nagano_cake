class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum production_status: {can_not_make:0,wait:1,producting:2,finished:3}
end
