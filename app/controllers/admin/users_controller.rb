class Admin::UsersController < Admin::BaseController
  before_action :load_user, except: %i(new index create)

  def index
    @users = User.all.user_order.page(params[:page]).
      per Settings.user.user_number
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".create_user_success"
      redirect_to admin_users_path
    else
      flash.now[:error] = t ".create_user_fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params_update_password) && @user.password
      flash[:success] = "Update password success!"
      redirect_to admin_users_path
    elsif @user.update_attributes user_params_edit_not_password
      flash[:success] = t ".success"
      redirect_to admin_users_path
    else
      flash.now[:danger] = t ".fail"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] = t ".delete_success"
      respond_to do |format|
        format.html {
          redirect_to admin_users_path
        }
        format.js
      end
    else
      flash.now[:danger] = t ".delete_failed"
      redirect_to admin_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :permision
  end

  def user_params_edit_not_password
    params.require(:user).permit :name, :email, :permision
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
