class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(user_id: current_user.id,book_id: book.id)
    comment.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.find(book_id: book.id)
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
end
