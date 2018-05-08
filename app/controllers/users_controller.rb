class UsersController < ApplicationController
  before_action :load_user, except: %i(index new)
  before_action :request_book_accept, :request_book_pending, only: :show

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).user_order.page(params[:page]).
      per Settings.book.number_book_page
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

  def request_book_pending
    @request_book_pendings = RequestBook.where(user_id: params[:id], status: "pending")
  end

  def request_book_accept
    @request_book_accepts = RequestBook.where(user_id: params[:id], status: "accept")
  end

  def load_user
    @user = User.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @user
  end
end
