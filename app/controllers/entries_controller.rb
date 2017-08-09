class EntriesController < ApplicationController

  before_action :set_entry, only: [:edit, :update, :destroy]
  before_action :set_account_options_for_select, only: [:new, :edit, :create, :update]
  before_action :set_category_options_for_select, only: [:new, :edit, :create, :update]

  def index
    @entries = Entry.all
    @entries_amount_to_pay = Entry.total_amount_to_pay
    @entries_amount_paid = Entry.total_amount_paid
    @entries_amount_to_receive = Entry.total_amount_to_receive
    @entries_amount_received = Entry.total_amount_received
    @entries_saldo = (Entry.total_amount_received - Entry.total_amount_paid)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params_entry)

    if @entry.save
      redirect_to entries_path, notice: "Conta criada com sucesso!"
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @entry.update(params_entry)
      redirect_to entries_path, notice: "Conta atualizada com sucesso!"
    else
      render :edit
    end

  end

  def destroy
    if @entry.destroy
      redirect_to entries_path, notice: "Conta excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def set_account_options_for_select
    @account_options_for_select = Account.all
  end

  def set_category_options_for_select
    @category_options_for_select = Category.all
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def params_entry
    params.require(:entry).permit(:id, :description, :entry_type, :amount, :date, :account_id, :category_id, :obs, :status)
  end
end
