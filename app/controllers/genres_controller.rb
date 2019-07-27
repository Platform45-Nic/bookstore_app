class GenresController < ApplicationController

  def index
    @genre = Genre.all
  end

  def show
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @user_id = current_user.id
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "You have created a Genre"
      redirect_to index
    else
      render 'new'
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name, :created_by_id)
    end
end
