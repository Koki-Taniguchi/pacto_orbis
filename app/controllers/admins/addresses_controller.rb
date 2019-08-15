class Admins::AddressesController < Admins::Base
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to admins_user_path(address.user)
  end
end
