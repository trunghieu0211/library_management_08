class AuthorsController < ApplicationController
  before_action :load_author, except: %i(new index create)

  def index
    @authors = Author.all.author_order.page(params[:page]).per 8
  end

  def show
  end

  private

  def author_params
    params.require(:author).permit :name, :description, :avatar
  end

  def load_author
    @author = Author.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @author
  end
end
