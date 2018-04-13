class BooksController < ApplicationController
  before_action :load_book, except: %i(new index create)
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).includes(:authors, :categories, :publisher).book_order.page(params[:page]).
      per Settings.book.number_book_page
  end

  def show
    @reviews = @book.reviews.review_order.page(params[:page]).per 4
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  private

  def book_params
    params.require(:book).permit :name, :publisher_id, :status, :description,
      :image_url, :number_page
  end

  def load_book
    @book = Book.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @book
  end
end
