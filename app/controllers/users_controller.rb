class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
