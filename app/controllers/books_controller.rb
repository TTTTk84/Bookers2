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
    @comment = BookComment.new
    @comments = BookComment.where(book_id: params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if !(@book.user_id == current_user.id)
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error"
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      @book.update(books_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      flash[:notice] = "error"
      render :edit
    end
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
