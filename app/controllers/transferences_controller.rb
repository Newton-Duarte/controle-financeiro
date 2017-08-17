class TransferencesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_account_options_for_select, only: [:new, :edit, :create, :update]
  before_action :set_transference, only: [:edit, :update, :destroy]

  def index
    @transferences = Transference.page(params[:page]).per(10)
  end

  def new
    @transference = Transference.new
  end

  def create
    @transference = Transference.new(params_transference)
    @transference = current_user

    if @transference.save
      update_account_balance!
      redirect_to transferences_path, notice: "Transferência realizada com sucesso!"
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @transference.update(params_transference)
      redirect_to transferences_path, notice: "Transferência atualizada com sucesso!"
    else
      render :edit
    end

  end

  def destroy
    if @transference.destroy
      update_account_balance_after_destroy!
      redirect_to transferences_path, notice: "Transferência excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def update_account_balance!
    debit_account = Account.find(@transference.debit_account)
    credit_account = Account.find(@transference.credit_account)

    debit_account.balance -= @transference.amount
    credit_account.balance += @transference.amount
    debit_account.save!
    credit_account.save!
  end

  def update_account_balance_after_destroy!

    debit_account = Account.find(@transference.debit_account)
    credit_account = Account.find(@transference.credit_account)

    debit_account.balance += @transference.amount
    credit_account.balance -= @transference.amount
    debit_account.save!
    credit_account.save!

  end

  def set_account_options_for_select
    @account_options_for_select = Account.all
  end

  def set_transference
    @transference = Transference.find(params[:id])
  end

  def params_transference
    params.require(:transference).permit(:id, :date, :amount, :debit_account, :credit_account, :obs)
  end
end
