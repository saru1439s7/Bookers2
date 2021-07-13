class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to books_path, notice: 'You have created book successfully.'
    else
      render :new
    end
  end

  def index
     @books = Book.all
      book = Book.all
     @user = current_user
     @book_new = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(blog_params)
    redirect_to books_path(book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(book)
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end