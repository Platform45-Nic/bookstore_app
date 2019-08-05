class TransactionsController < ApplicationController

  def index
    @transaction = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = "You have Purchased a Book"
      redirect_to @transaction
    else
      render 'new'
    end
  end

  private

    def transaction_params
      params.permit(:transaction_comment, :user_id, :book_id)
    end

end
