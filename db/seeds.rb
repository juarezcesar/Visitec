# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Clients
basilio     = Client.create!({name: 'Basílio de Magno', address: 'Alameda Dr. Carlos de Carvalho, 771 - Curitiba, Paraná'})
bernado     = Client.create!({name: 'Bernado Claraval', address: 'Avenida Cidade Jardim, 400 - São Paulo, São Paulo'})
camilo      = Client.create!({name: 'Camilo de Léllis', address: 'R. Buenos Aires, 1260 - Água Verde, Curitiba - PR'})
catarina    = Client.create!({name: 'Catarina de Sena', address: 'Rua Guilherme Pugsley, 1705 - Água Verde, Curitiba - PR'})
domingos    = Client.create!({name: 'Domingos de Gusmão', address: 'R. Buenos Aires, 50 - Batel, Curitiba - PR'})
francisco   = Client.create!({name: 'Franciso Caracciolo', address: 'Rua Sêneca, 92 - São José dos Pinhais - PR'})
julia       = Client.create!({name: 'Julia Salzano', address: 'Rua Izabel a Redento, 1570 - Centro - São José dos Pinhais - PR'})

puts '7 Clients created'

#Agents
cartola   = Agent.create!({name: 'Cartola', address: 'R. Viriato Corrêa, 742, Curitiba, Paraná'})
ary       = Agent.create!({name: 'Ary Barroso', address: 'Av. Pres. Getúlio Vargas, 3526 - Rebouças, Curitiba - PR'})
nelson    = Agent.create!({name: 'Nelson Gonçalves', address: 'Rua Santa Bertila Boscardin, 213 - Santa Felicidade, Curitiba - PR'})
lupcinio  = Agent.create!({name: 'Lupícinio Rodrigues', address: 'Av. Pref. Erasto Gaertner, 1000 - Bacacheri, Curitiba - PR'})
adoniran  = Agent.create!({name: 'Adoniran Barbosa', address: 'Rua José Lins do Rêgo, 885 - Bairro Alto, Curitiba - PR'})
baden     = Agent.create!({name: 'Baden Powell', address: 'R. Dr. Bley Zornig, 1554 - Boqueirão, Curitiba - PR'})

puts '6 Agents created'

Appointment.create!({description: "Limpeza 4 ACs", client: julia, agent: cartola})
Appointment.create!({description: "Preenchimento gás AC", client: julia, agent: cartola})
Appointment.create!({description: "Substituir split", client: julia, agent: cartola})
Appointment.create!({description: "Revisão oito ACs", client: julia, agent: cartola})
Appointment.create!({description: "Limpeza Caixa de Água", client: julia, agent: ary})
Appointment.create!({description: "Troca painel solar", client: julia, agent: ary})
Appointment.create!({description: "Vazamento Boiler", client: julia, agent: ary})
Appointment.create!({description: "Painel aquecedor defeito display", client: julia, agent: nelson})
Appointment.create!({description: "Aquecimento elétrico Boiler não funciona", client: julia, agent: nelson})
Appointment.create!({description: "Orçamento Aquecimento Solar", client: julia, agent: adoniran})

puts '10 Appointments created'



