class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def new
    @user = User.new
  end

  def destroy
  end

  private
  def users_params
    params.require(:user).permit(:profile_image)
  end
end
