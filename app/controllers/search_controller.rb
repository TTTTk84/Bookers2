class SearchController < ApplicationController

  def return_model(model)
    case model
    when "User"
      return User.all
    when "Book"
      return Book.all
    end
  end

  def render_search
    keyword = params[:keyword]
    model = return_model(params[:model])
    search_style = params[:search_style]
    @user = User.find(current_user.id)
    @book = Book.new

    case search_style
    when "all"
      model = model.where("name  LIKE ?", "#{keyword}")
    when "before"
      model = model.where("name  LIKE ?", "#{keyword}%")
    when "after"
      model = model.where("name  LIKE ?", "%#{keyword}")
    when "part"
      model = model.where("name  LIKE ?", "%#{keyword}%")
    end

    if User == model.model
      @users = model
      render 'users/index'
    elsif Book == model.model
      @books = model
      render 'books/index'
    end
  end

end
