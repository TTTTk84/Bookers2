class BooksController < ApplicationController
  def index

    if User.find(current_user.id)
      @books = Book.all
      @user = User.find(current_user.id)
    end
    @book = Book.new
  end

  def show
    @book_detail = Book.find(params[:id])
    @user = User.find(@book_detail.user_id)
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render :edit
    end
  end

  private
  def books_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end
