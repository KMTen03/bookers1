class BooksController < ApplicationController
  def top
    @book = Book.new

  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to '/books'
    else
      @books = Book.all
      flash[:success] = "error"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    book = Book.update(book_params)
    if book.update
      flash[:success] = "Book was successfully updated."
      redirect_to '/books'
    else
      @books = Book.all
      flash[:success] = "error"
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
