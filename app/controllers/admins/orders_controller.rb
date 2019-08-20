class Admins::OrdersController < Admins::Base
  def index
    @orders = Order.page(params[:page]).per(8)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_order_path(@order)
    else
      flash[:error] = "更新に失敗しました"
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
