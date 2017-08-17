class CreateTransferences < ActiveRecord::Migration
  def change
    create_table :transferences do |t|
      t.date :date
      t.float :amount, default: 0.00
      t.integer :debit_account
      t.integer :credit_account
      t.text :obs

      t.timestamps null: false
    end
  end
end
