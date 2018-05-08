class AuthorsController < ApplicationController
  before_action :load_author, except: %i(new index create)

  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true).author_order.page(params[:page]).
      per Settings.book.number_book_page
  end

  def show
  end

  private

  def author_params
    params.require(:author).permit :name, :avatar, :description
  end

  def load_author
    @author = Author.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @author
  end
end
