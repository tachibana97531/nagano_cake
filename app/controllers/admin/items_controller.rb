class Admin::ItemsController < ApplicationController
  def index
    @item_all = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item_find = Item.find(params[:id])
  end
  
  

  def edit
    @item_find = Item.find(params[:id])
  end

  def update
    @item_find = Item.find(params[:id])
    @item_find.update(item_params)
    redirect_to admin_item_path(@item_find.id)
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:price,:is_active,:image)
  end
end
