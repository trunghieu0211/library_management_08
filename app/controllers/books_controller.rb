class BooksController < ApplicationController
  before_action :load_book, except: %i(new index create)

  def index
    @books = Book.all.book_order.page(params[:page]).per 12
  end

  def show
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
