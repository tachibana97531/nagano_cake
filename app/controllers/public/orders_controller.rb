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
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @order.postage = 800
  end

  def complete
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart.amount
        @order_detail.price_tax = cart.item.add_price_tax
        @order_detail.production_status = "can_not_make"
        @order_detail.save
      end
      redirect_to orders_complete_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order_find = Order.find(params[:id])
    @order_details = @order_find.order_details.all
  end
  
  
  private
  
  def order_params
    params.permit(:postal_code,:address,:name,:pay_method,:postage,:billing,:status)
  end
end
