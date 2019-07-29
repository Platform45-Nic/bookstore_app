class StaticPagesController < ApplicationController
  def index
    if current_user.present?
      @user = User.find(current_user.id)
    else
      render "home"
    end
  end

  def home
    # @book = Book.all.map { |b| [b.title, b.description, b.author_id, b.genre_id] }
    @book = Book.all.map{ |b| [b.title, b.description, get_user_name_from_id(b), get_genre_name_from_id(b)]}.to_h
    # @book_list_hash = Hash.new do |hash, key|
    #   @book.each do |b|
    #     @book_title = b.title
    #     @book_description = b.description
    #     @book_author_name = get_user_name_from_id(b)
    #     @book_genre_name = get_genre_name_from_id(b)
    #     @book_list_hash[]
    #     hash[key] = {title: @book_title, description: @book_description, author_name: @book_author_name, book_genre: @book_genre_name}
    #     end
    #   end
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
