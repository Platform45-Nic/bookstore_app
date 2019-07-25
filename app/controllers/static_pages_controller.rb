class StaticPagesController < ApplicationController
  def index
    @user = User.all
    @books = Book.limit(5)
  end
end
