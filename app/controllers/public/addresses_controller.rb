class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @address_all = Address.all
  end

  def edit
    @address_find = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address_find = Address.find(params[:id])
    @address_find.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address_find = Address.find(params[:id])
    @address_find.destroy
    redirect_to addresses_path
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
end
