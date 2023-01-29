class Public::CartItemsController < ApplicationController
  def index
    @cart_item_all = CartItem.all
    @total = @cart_item_all.inject(0) { |sum, cart_item| sum + cart_item.item.add_price_tax*(cart_item.amount) }
  end

  def update
  end

  def destroy
    @cart_item_find = CartItem.find(item_id)
    @cart_item_find.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
