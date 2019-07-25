class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    aid = @book.author_id
    @user = User.find(aid)
  end
end
