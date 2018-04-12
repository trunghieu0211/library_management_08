class RequestBooksController < ApplicationController
  before_action :load_request, except: %i(new index create)

  def create
    @request_book = RequestBook.new request_params
    @request_book.status ||= RequestBook.statuses.keys[0]
    @book = Book.find_by id: request_params[:book_id]
    if @request_book.save
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    else
      flash.now[:danger] = t ".fail"
    end
  end

  def destroy
    @book = @request.book
    if @request.destroy
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

  def request_params
    params.require(:request_book).permit :user_id, :book_id, :status
  end

  def load_request
    @request = RequestBook.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @request
  end
end
