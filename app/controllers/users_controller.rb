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
    if !(@user.id == current_user.id)
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      @user.update(users_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  def destroy
  end

  private
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
