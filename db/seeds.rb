# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Client.create!([
    {name: 'Basílio de Magno', address: 'Alameda Dr. Carlos de Carvalho, 771 - Curitiba, Paraná'},
    {name: 'Bernando Claraval', address: 'Avenida Cidade Jardim, 400 - São Paulo, São Paulo'},
    {name: 'Camilo de Léllis', address: 'R. Buenos Aires, 1260 - Água Verde, Curitiba - PR'},
    {name: 'Catarina de Sena', address: 'Rua Guilherme Pugsley, 1705 - Água Verde, Curitiba - PR'},
    {name: 'Domingos de Gusmão', address: 'R. Buenos Aires, 50 - Batel, Curitiba - PR'},
    {name: 'Franciso Caracciolo', address: 'Rua Sêneca, 92 - São José dos Pinhais - PR'},
    {name: 'Julia Salzano', address: 'Rua Izabel a Redento, 1570 - Centro - São José dos Pinhais - PR'}
  ])

puts '7 clientes created'



