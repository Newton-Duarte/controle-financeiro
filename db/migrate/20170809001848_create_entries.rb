class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :description
      t.string :entry_type
      t.integer :amount
      t.date :date
      t.references :account, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.text :obs
      t.string :status

      t.timestamps null: false
    end
  end
end
