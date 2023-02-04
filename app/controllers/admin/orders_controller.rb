class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id:params[:id])
    if @order.update(status_params)
      @order_details.update_all(production_status:"wait") if @order.status == "confirm"
    end
    redirect_to admin_path(@order.id)
  end
  
  
  private
  
  def status_params
    params.require(:order).permit(:status)
  end
end
