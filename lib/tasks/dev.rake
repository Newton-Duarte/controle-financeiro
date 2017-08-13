namespace :dev do

  desc "Cria categorias"
  task setup: :environment do

    puts "Executando o setup para desenvolvimento"

    puts "Apagando BD... #{%x(rake db:drop)}"
    puts "Criando BD... #{%x(rake db:create)}"
    puts  %x(rake db:migrate)
    puts  %x(rake db:seed)
    puts  %x(rake dev:generate_categories)
    puts  %x(rake dev:generate_accounts)

    puts "Setup desenvolvimento concluído com sucesso!"

  end

  desc "Cria categorias"
  task generate_categories: :environment do

    puts "Criando categorias..."

    Category.create!(description:  "Salário")
    Category.create!(description:  "Energia Elétrica")
    Category.create!(description:  "Condomínio")
    Category.create!(description:  "Alimentação Casa")
    Category.create!(description:  "Alimentação Saídas")
    Category.create!(description:  "IPTU")
    Category.create!(description:  "IPVA")
    Category.create!(description:  "Tarifas Bancárias")
    Category.create!(description:  "Material Consumo")
    Category.create!(description:  "Serviços Prestados")
    Category.create!(description:  "Vendas Mercadorias")

    puts "Categorias criadas com sucesso!"

  end

  desc "Cria contas"
  task generate_accounts: :environment do

    puts "Criando contas..."

    Account.create!(description:  "Carteira", balance: 0.00)
    Account.create!(description:  "C.E.F 30676-1", balance: 0.00)

    puts "Contas criadas com sucesso!"


  end

end
