class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:order_detail][:order_id])
    @order_details = @order.order_details.all
    
    is_updated = true
    if @order_detail.update(product_params)
      @order.update(status:"making") if @order_detail.production_status == "producting"
      @order_details.each do |details|
        if details.production_status != "finished"
          is_updated = false
        end
      end
      @order.update(status:"priparing") if is_updated
    end
    redirect_to admin_path(@order_detail.order.id)
  end
  
  
  private
  
  def product_params
    params.require(:order_detail).permit(:production_status)
  end
end
