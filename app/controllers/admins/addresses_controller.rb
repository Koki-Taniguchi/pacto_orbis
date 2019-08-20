class Admins::AddressesController < Admins::Base
  def destroy
    address = Address.find(params[:id])
    if address.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to admins_user_path(address.user)
  end
end
