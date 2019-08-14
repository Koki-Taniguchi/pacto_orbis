class Admins::AddressesController < ApplicationController
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to admins_user_path(address.user)
  end
end
