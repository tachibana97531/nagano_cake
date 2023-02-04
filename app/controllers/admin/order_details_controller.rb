class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(product_params)
    redirect_to admin_path(@order_detail.order.id)
  end
  
  
  private
  
  def product_params
    params.require(:order_detail).permit(:production_status)
  end
end
