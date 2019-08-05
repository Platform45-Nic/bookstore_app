class StaticPagesController < ApplicationController

  def index
    if current_user.present?
      @user = User.find(current_user.id)
    else
      render "home"
    end
  end

  def show
    @user = User.find(current_user.id)
    @transaction = Transaction.where(user_id: @user.id)
  end

  def home
    if current_user.present?
      @user = User.find(current_user.id)
      @book = Book.where(author_id: @user)
    else
      @book = Book.all
    end
  end

  private

    def get_user_name_from_id(author_id)
      User.where(author_id: author_id).first_name
    end

    def get_genre_name_from_id(genre_id)
      Genre.find(genre_id).name
    end
end
