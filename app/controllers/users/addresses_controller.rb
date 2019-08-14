class Users::AddressesController < ApplicationController
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
      redirect_to new_order_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to new_order_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
