class AddBalanceToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :balance, :float, default: 0.00
  end
end
