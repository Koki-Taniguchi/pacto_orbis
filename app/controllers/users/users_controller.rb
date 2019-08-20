class Users::UsersController < Users::Base
  before_action :authenticate_user!
  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to users_path
    else
      flash[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def unsubscribe_confirm
  end

  def unsubscribe
    user = current_user
    user.update({is_deleted: true})
    redirect_to users_sign_out_path
  end

  private

  def user_params
    params.require(:user).permit( :last_name,
                                  :first_name,
                                  :kana_last_name,
                                  :kana_first_name,
                                  :postal_code,
                                  :address,
                                  :email,
                                  :phone)
  end

end
