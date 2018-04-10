class Admin::RequestBooksController < Admin::BaseController
  before_action :load_request, except: %i(new index create)

  def index
    @q = RequestBook.ransack(params[:q])
    @requests = @q.result(distinct: true).request_order.page(params[:page]).
      per Settings.request.number_request_page
    @allRequest = RequestBook.all
    respond_to do |format|
      format.html
      format.csv {send_data @allRequest.to_csv}
      format.xls {send_data @allRequest.to_csv(col_sep: "\t")}
    end
  end

  def edit
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = t ".success"
      redirect_to admin_request_books_path
    else
      flash.now[:danger] = t ".fail"
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash.now[:success] = t ".delete_success"
      respond_to do |format|
        format.html {
          redirect_to admin_request_books_path
        }
        format.js
      end
    else
      flash.now[:danger] = t ".delete_failed"
      redirect_to admin_request_books_path
    end
  end

  private

  def request_params
    params.require(:request_book).permit :user_id, :book_id, :status, :date_begin,
      :date_end
  end

  def load_request
    @request = RequestBook.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @request
  end
end
