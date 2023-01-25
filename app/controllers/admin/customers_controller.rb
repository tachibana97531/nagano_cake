class Admin::CustomersController < ApplicationController
  def index
    @customer_all = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
