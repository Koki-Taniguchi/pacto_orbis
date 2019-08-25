class Users::OrdersController < Users::Base
  before_action :authenticate_user!
  before_action :check_params, only: [:create]
  before_action :check_cart_items, only: [:create]

  def index
    @orders = current_user.orders.page(params[:page]).per(10)
  end

  def new

  end

  def create
    order = current_user.orders.new(order_params)
    ActiveRecord::Base.transaction do
      if params[:order][:address_select] == 'self'
        order.postal_code = current_user.postal_code
        order.address = current_user.address
      elsif params[:order][:address_select] == 'new'
        order.postal_code = params[:order][:new_postal_code]
        order.address = params[:order][:new_address]
      else
        address = current_user.addresses.find(params[:order][:address_select])
        order.postal_code = address.postal_code
        order.address = address.address
      end

      current_user.cart_items.each do |cart_item|
        od = order.order_details.build
        od.item_id = cart_item.item_id
        od.cd_amount = cart_item.amount
        od.cd_price = cart_item.item.price
        cart_item.item.stock -= cart_item.amount
        cart_item.item.status = false if cart_item.item.stock <= 0
        cart_item.item.save!
        cart_item.destroy!
      end

      order.delivery_cost = Order::NOW_POSTAGE
      order.total_price = order.order_details.sum(&:total_price) * Item::TAX  + Order::NOW_POSTAGE
      order.save!
    end
    
    if order.persisted?
      redirect_to completion_orders_path
    else
      flash[:error] = "購入に失敗しました"
      render :new
    end
  end

  def completion
  end

  private

  def order_params
    params.require(:order).permit(:payment)
  end

  def check_cart_items
    redirect_to items_path if current_user.cart_items.blank?
  end

  def check_params
    if params[:order][:address_select].blank? || params[:order][:payment].blank?
      flash[:error] = "すべて選択されていません"
      render :new
    end
  end
  
end
