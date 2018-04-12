class LikesController < ApplicationController
  before_action :load_book
  before_action :load_like, only: [:edit, :update, :destroy]

  def create
    @like = @book.likes.build like_params
    @like.user = current_user
    @like.is_like = true

    if @like.save
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    else
      flash.now[:danger] = t ".fail"
    end
  end

  def destroy
    @like.user_id = current_user.id
    if @like.destroy
      flash.now[:success] = t ".delete_success"
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    else
      flash.now[:danger] = t ".delete_failed"
    end
  end

  private

  def like_params
    params.require(:like).permit :user_id, :book_id
  end

  def load_book
    @book = Book.find_by id: params[:book_id]

    render file: "public/404.html", layout: false unless @book
  end

  def load_like
    @like = @book.likes.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @like
  end
end
