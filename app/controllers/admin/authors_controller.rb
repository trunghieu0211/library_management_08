class Admin::AuthorsController < Admin::BaseController
  before_action :load_author, except: %i(new index create)

  def index
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params

    if @author.save
      flash[:success] = t ".create_author_success"
      redirect_to admin_authors_path
    else
      flash.now[:error] = t ".create_author_fail"
      render :new
    end
  end

  def edit
  end

  private

  def author_params
    params.require(:author).permit :name
  end

  def load_author
    @author = Author.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @author
  end
end
