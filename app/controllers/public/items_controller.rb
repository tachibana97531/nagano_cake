class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
  end

  def show
    @genres = Genre.all
    @item_find = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
