class StaticPagesController < ApplicationController
  def index
    if current_user.present?
      @user = User.find(current_user.id)
    else
      render "home"
    end
  end

  def home
  end
end
