class Users::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update

  end

  def unsubscribe_confirm

  end

  def unsubscribe

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
