class Admin::BooksController < Admin::BaseController
  before_action :load_book, except: %i(new index create)
  before_action :load_publisher, :load_author, :load_category, only: %i(new edit)

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).includes(:authors, :categories, :publisher).book_order.page(params[:page]).
      per Settings.book.number_book_page
    @allBook = Book.all
    respond_to do |format|
      format.html
      format.csv {send_data @allBook.to_csv}
      format.xls {send_data @allBook.to_csv(col_sep: "\t")}
    end
  end

  def new
    @book = Book.new
    @author_book = @book.authorBooks.build
    @category_book = @book.categoryBooks.build
  end

  def create
    @book = Book.new book_params

    params[:book][:authorBook_ids].each do |author|
      @book.authorBooks.build(:author_id => author) unless author.empty?
    end

    params[:book][:categoryBook_ids].each do |category|
      @book.categoryBooks.build(:category_id => category) unless category.empty?
    end

    if @book.save
      flash[:success] = t ".create_book_success"
      redirect_to admin_books_path
    else
      flash.now[:error] = t ".create_book_fail"
      render :new
    end
  end

  def edit
  end

  def update

    if @book.update_attributes book_params
      flash[:success] = t ".success"
      redirect_to admin_books_path
    else
      flash.now[:danger] = t ".fail"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash.now[:success] = t ".delete_success"
      respond_to do |format|
        format.html {
          redirect_to admin_books_path
        }
        format.js
      end
    else
      flash.now[:danger] = t ".delete_failed"
      redirect_to admin_books_path
    end
  end

  private

  def book_params
    params.require(:book).permit :publisher_id, :name, :status, :description,
      :image_url, :number_page
  end

  def load_book
    @book = Book.find_by id: params[:id]

    render file: "public/404.html", layout: false unless @book
  end

  def load_publisher
    @publishers = Publisher.all
  end

  def load_category
    @categories = Category.all
  end

  def load_author
    @authors = Author.all
  end
end
