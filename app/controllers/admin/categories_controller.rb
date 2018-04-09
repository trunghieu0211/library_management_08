class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, except: %i(new index create)

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t ".create_category_success"
      redirect_to admin_categories_path
    else
      flash.now[:error] = t ".create_category_fail"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @category
  end
end
