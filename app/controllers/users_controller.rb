class UsersController < ApplicationController
  before_action :load_user, except: %i(new index create)

  def index
    @users = User.all.user_order.page(params[:page]).per 8
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit :name, :avatar
  end

  def load_user
    @user = User.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @user
  end
end
