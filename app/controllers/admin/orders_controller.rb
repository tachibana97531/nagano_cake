class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status_params)
    redirect_to admin_path(@order.id)
  end
  
  
  private
  
  def status_params
    params.require(:order).permit(:status)
  end
end
