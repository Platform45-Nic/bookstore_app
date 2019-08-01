class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
    # aid = @book.author_id
    # @user = User.find(aid)
  end

  def profile
    if current_user.present?
    @user = User.find(current_user.id)
    @book = Book.all.find(current_user.id)
    @genre = get_genre_id(@book.genre_id)
    else
      redirect_to login_path
    end
  end

  def new
    @book = Book.new
  end

  def create
    # @user_id = current_user.id
    # @genre_list = list_all_genre
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "You have created a Book"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "You have updated a Book"
      redirect_to @book
    else
      render 'edit'
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :description, :author_id, :genre_id)
    end

    # def get_user_id
    #   @user_id = User.find(current_user.id)
    # end

    def get_genre_id(selected_genre)
      @genre_id = Genre.find(selected_genre)
    end

    # def list_all_genre
    #   @genre_by_name = Genre.all
    # end
end
