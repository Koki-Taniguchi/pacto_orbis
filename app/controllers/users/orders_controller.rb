class Users::OrdersController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  private

  def order_params
    params.require(:order).permit(:payment, :address, :postal_code)
  end

end
