class Admin::CustomersController < ApplicationController
  def index
    @customer_all = Customer.all
  end

  def show
    @c_find = Customer.find(params[:id])
  end

  def edit
    @c_find = Customer.find(params[:id])
  end

  def update
    @c_find = Customer.find(params[:id])
    @c_find.update(customer_params)
    redirect_to admin_customer_path(@c_find.id)
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:encrypted_password,:email,:address,:telephone_number,:postal_code,:is_deleted)
  end
end
