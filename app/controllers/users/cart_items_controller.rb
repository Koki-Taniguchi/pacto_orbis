class Users::CartItemsController < Users::Base
  def index
    @cart_items = current_user.cart_items.where(user_id: current_user.id)
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
      redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:item_id])
      render 'users/items/show'
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
