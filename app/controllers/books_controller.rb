class BooksController < ApplicationController
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
end
