# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando Contas Financeira..."

Account.create!(description:  "Carteira", balance: 0.00)
Account.create!(description:  "C.E.F 30676-1", balance: 0.00)

puts "Cadastrando Contas Financeira...[OK]"


puts "Cadastrando Categorias..."

Category.create!(description:  "Salário")
Category.create!(description:  "Energia Elétrica")
Category.create!(description:  "IPTU")
Category.create!(description:  "IPVA")
Category.create!(description:  "Despesas Diversas")

puts "Cadastrando Categorias...[OK]"
