class AccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update, :destroy]

  def index
    @accounts = Account.by_user(current_user)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params_account)
    @account.user = current_user

    if @account.save
      redirect_to accounts_path, notice: "Conta criada com sucesso!"
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @account.update(params_account)
      redirect_to accounts_path, notice: "Conta atualizada com sucesso!"
    else
      render :edit
    end

  end

  def destroy
    if @account.destroy
      redirect_to accounts_path, notice: "Conta excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def params_account
    params.require(:account).permit(:id, :description, :balance)
  end
end
