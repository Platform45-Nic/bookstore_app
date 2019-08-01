class StaticPagesController < ApplicationController

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  def index
    if current_user.present?
      @user = User.find(current_user.id)
    else
      render "home"
    end
  end

  def home
    # if current_user.present?
    @user = User.find(current_user.id)
    @book = Book.all.find(current_user.id)
  end

  private

    def get_user_name_from_id(books_list_in_array_format)
      @user_id = books_list_in_array_format.author_id
      @user_name = User.find(@user_id).first_name
      return @user_name
    end

    def get_genre_name_from_id(books_list_in_array_format)
      @genre_id = books_list_in_array_format.genre_id
      @genre_name = Genre.find(@genre_id).name
      return @genre_name
    end
end
