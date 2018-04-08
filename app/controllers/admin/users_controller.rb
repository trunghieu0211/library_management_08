class Admin::UsersController < Admin::BaseController
  def index
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
    @user = User.find_by id: params[:id]
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :permision
  end
end
