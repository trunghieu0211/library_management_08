class UsersController < ApplicationController
  before_action :load_user, except: %i(index new)

  def index
    @users = User.all.user_order.page(params[:page]).per 8
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params_update_password) && @user.password
      flash[:success] = t ".success_password"
      redirect_to user_path @user
    elsif @user.update_attributes user_params_edit_not_password
      flash[:success] = t ".success"
      redirect_to user_path @user
    else
      flash.now[:danger] = t ".fail"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :password,
      :password_confirmation, :phone, :avatar
  end

  def user_params_edit_not_password
    params.require(:user).permit :name, :phone, :avatar
  end

  def user_params_update_password
    params.require(:user).permit :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @user
  end
end
