class Public::ItemsController < ApplicationController
  def index
    @item_all = Item.all
  end

  def show
    @item_find = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
