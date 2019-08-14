class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
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
