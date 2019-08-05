class StaticPagesController < ApplicationController

  def index
    if current_user.present?
      @user = User.find(current_user.id)
    else
      render "home"
    end
  end

  def home
    if current_user.present?
      @user = User.find(current_user.id)
      @book = Book.where(author_id: @user)
      # @user = User.find(current_user.id)
      # @book = Book.all.find(current_user.id)
    else
      @book = Book.all
      # @user = get_user_name_from_id(@book.author_id)
      # @genre = get_genre_name_from_id(@book.genre_id)
      # @book = Book.all.map { |k, v| {title: v.title, description: v.description, genre: get_genre_name_from_id(v.genre_id), author: get_user_name_from_id(v.author_id)}}
      # @book += Book.all do |books|
      #   @user = User.find(books.author_id).first_name
      #   @book_genre = get_genre_name_from_id(books.genre_id)
      # end
    end
    # @book_genre = @book.each do
    #   get_genre_name_from_id(@book.genre_id)
    # end
  end

  private

    def get_user_name_from_id(author_id)
      User.where(author_id: author_id).first_name
    end

    def get_genre_name_from_id(genre_id)
      Genre.find(genre_id).name
    end
end
