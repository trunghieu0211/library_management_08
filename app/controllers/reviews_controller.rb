class ReviewsController < ApplicationController
  before_action :load_book
  before_action :load_review, only: [:edit, :update, :destroy]

  def create
    @review = @book.reviews.create review_params
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html {redirect_to @book}
        format.js
      else
        flash[:danger] = t ".create_fail"
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update review_params
        format.html {redirect_to @book}
        format.js
      else
        flash[:danger] = t ".update_fail"
        format.html {render :edit}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @review.destroy
        format.html {redirect_to @book}
        format.js
      else
        flash[:danger] = ".destroy_fail"
        format.html {redirect_to @book}
      end
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :rating
  end

  def load_book
    @book = Book.find_by id: params[:book_id]

    render file: "public/404.html", layout: false unless @book
  end

  def load_review
    @review = @book.reviews.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @review
  end
end
