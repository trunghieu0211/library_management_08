class Admin::PublishersController < Admin::BaseController
  before_action :load_publisher, except: %i(new index create)

  def index
    @q = Publisher.ransack(params[:q])
    @publishers = @q.result(distinct: true).publisher_order.page(params[:page]).
      per Settings.publisher.number_publisher_page
    @allPublisher = Publisher.all
    respond_to do |format|
      format.html
      format.csv {send_data @allPublisher.to_csv}
      format.xls {send_data @allPublisher.to_csv(col_sep: "\t")}
    end
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publisher_params

    if @publisher.save
      flash[:success] = t ".create_publisher_success"
      redirect_to admin_publishers_path
    else
      flash.now[:error] = t ".create_publisher_fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t ".success"
      redirect_to admin_publishers_path
    else
      flash.now[:danger] = t ".fail"
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      flash.now[:success] = t ".delete_success"
      respond_to do |format|
        format.html {
          redirect_to admin_publishers_path
        }
        format.js
      end
    else
      flash.now[:danger] = t ".delete_failed"
      redirect_to admin_publishers_path
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit :name
  end

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @publisher
  end
end
