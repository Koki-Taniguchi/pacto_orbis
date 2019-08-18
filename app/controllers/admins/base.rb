class Admins::Base < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'

  protected
  
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
