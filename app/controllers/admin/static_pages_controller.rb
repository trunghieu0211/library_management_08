class Admin::StaticPagesController < Admin::BaseController
  def home
    @users = User.all
    @categories = Category.all
    @books = Book.all
    @authors = Author.all
    @publishers = Publisher.all
    @requests = RequestBook.all
  end
end
