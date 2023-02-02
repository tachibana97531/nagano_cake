class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.item.add_price_tax*(cart_item.amount) }
    if params[:order][:address_number] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_number] == "2"
      @order = Order.new(order_params)
    end
    @order.postage = 800
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:pay_method)
  end
end
