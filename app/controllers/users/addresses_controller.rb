class Users::AddressesController < Users::Base
  before_action :authenticate_user!
  def create
    address = Address.new(address_params)
    address.user_id = current_user.id
    if address.save
      render json: address
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "更新に成功しました"
      redirect_to new_order_path
    else
      flash[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to new_order_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
