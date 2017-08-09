class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :provider_type
      t.string :cpf_cnpj
      t.string :nome_razao_social
      t.string :apelido_fantasia

      t.timestamps null: false
    end
  end
end
