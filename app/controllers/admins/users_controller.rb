class Admins::UsersController < Admins::Base
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page]).per(15)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_user_path(@user)
    else
      flash[:error] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "削除に成功しました"
    end
    redirect_to admins_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
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
