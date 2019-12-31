class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
    @book_detail = Book.find(params[:id])
    @user = User.find(@book_detail.user_id)
    @book = Book.new
  end

  def edit
  end

  def new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    end
  end

  def destroy
  end

  private
  def books_params
    params.require(:book).permit(:title,:body,:user_id,:image_id)
  end
end
