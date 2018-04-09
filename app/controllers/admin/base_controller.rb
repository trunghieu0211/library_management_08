class Admin::BaseController < ActionController::Base
  layout "admin/layouts/admin"

  before_action :verify_admin

  private

  def verify_admin
    if !user_signed_in?
      flash[:error] = t ".login"
      redirect_to new_user_session_path
    elsif current_user.permision == "admin" || current_user.permision == "manager"

    else
      flash[:error] = t ".permission"
      redirect_to root_path
    end
  end
end
