class EntriesController < ApplicationController

  before_action :set_entry, only: [:edit, :update, :destroy]
  before_action :set_account_options_for_select, only: [:new, :edit, :create, :update]
  before_action :set_category_options_for_select, only: [:new, :edit, :create, :update]

  def index
    @entries = Entry.page(params[:page]).per(10)
    @entries_group_by_category = Entry.group_by_category
    @entries_value_to_pay = Entry.total_value_to_pay
    @entries_value_paid = Entry.total_value_paid
    @entries_value_to_receive = Entry.total_value_to_receive
    @entries_value_received = Entry.total_value_received
    @entries_balance = (@entries_value_received - @entries_value_paid).round(2)
  end

  def new
    @entry = Entry.new(entry_type: params[:entry_type])
  end

  def create
    @entry = Entry.new(params_entry)

    if @entry.save
      update_account_balance!
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
      update_account_balance_after_destroy!
      redirect_to entries_path, notice: "Conta excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def update_account_balance!
    account = Account.find(@entry.account_id)

    if @entry.entry_type == "Despesa" && @entry.status == "Finalizado"
      account.balance -= @entry.value
      account.save!
    elsif @entry.entry_type == "Receita" && @entry.status == "Finalizado"
      account.balance += @entry.value
      account.save!
    else
      #
    end

  end

  def update_account_balance_after_destroy!
    account = Account.find(@entry.account_id)

    if @entry.entry_type == "Despesa" && @entry.status == "Finalizado"
      account.balance += @entry.value
      account.save!
    elsif @entry.entry_type == "Receita" && @entry.status == "Finalizado"
      account.balance -= @entry.value
      account.save!
    else
      #
    end

  end

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
    params.require(:entry).permit(:id, :description, :entry_type, :value, :date, :account_id, :category_id, :obs, :status)
  end
end
