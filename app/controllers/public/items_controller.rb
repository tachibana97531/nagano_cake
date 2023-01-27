class Public::ItemsController < ApplicationController
  def index
    @item_all = Item.all
  end

  def show
    @item_find = Item.find(params[:id])
  end
end
