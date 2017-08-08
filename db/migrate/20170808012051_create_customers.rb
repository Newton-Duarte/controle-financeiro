class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_type
      t.string :cpf_cnpj
      t.string :nome_razao_social
      t.string :apelido_fantasia

      t.timestamps null: false
    end
  end
end
