class Admin::OrdersController < ApplicationController
  def index

  end

  def show

  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end



end
