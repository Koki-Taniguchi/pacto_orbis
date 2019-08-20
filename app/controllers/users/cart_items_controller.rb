class Users::CartItemsController < Users::Base
  before_action :authenticate_user!
  before_action :check_item_stock, only: [:create, :update]
  def index
    @cart_items = current_user.cart_items.page(params[:page]).per(10)
  end

  def create
    if CartItem.find_by(user_id: current_user.id, item_id: params[:cart_item][:item_id])
      cart_item = CartItem.find_by(user_id: current_user.id, item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.user_id = current_user.id
    end

    if cart_item.save
      flash[:notice] = "カートに追加しました"
      redirect_to cart_items_path
    else
      flash[:error] = "カートに追加できませんでした"
      @item = Item.find(params[:cart_item][:item_id])
      render 'users/items/show'
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      flash[:notice] = "枚数の更新に成功しました"
    else
      flash[:error] = "枚数の更新できませんでした"
    end
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def check_item_stock
    if params[:cart_item][:amount].to_i > Item.find(params[:cart_item][:item_id]).stock
      redirect_back(fallback_location: root_path)
    end
  end

end
