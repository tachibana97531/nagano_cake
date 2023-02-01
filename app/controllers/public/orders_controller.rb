class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    if "address_number" == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order = Order.new(order_params)
    elsif "address_number" == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif "address_number" == "2"
      @order = Order.new(order_params)
    end
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
