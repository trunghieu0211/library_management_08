class Admin::PublishersController < Admin::BaseController
  before_action :load_publisher, except: %i(new index create)

  def index
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

  private

  def publisher_params
    params.require(:publisher).permit :name
  end

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @publisher
  end
end
