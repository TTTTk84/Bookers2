class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book_comment = BookComment.find(params[:book_id])
    @book = @book_comment.book
    if @book_comment.user != current_user
      redirect_to request.referer
    end
    @book_comment.destroy
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
