require 'net/http'



class AppointmentsController < ApplicationController

  include DeviseWhitelistConcern
  include GoogleConcern

  def map_locations


  end

  def calculate_distance

    @origins = ["Rua Seneca, 92 - São José dos Pinhais - PR",
                "Rua Izabel a Redento, 1570 - Centro - São José dos Pinhais - PR"]
    @destinations = ["R. Quinze de Novembro, 1310 - Centro, São José dos Pinhais - PR",
                     "Av. Gonzáles Pecotche, 123 - Aristocrata, São José dos Pinhais - PR"]

    distance = distance @origins, @destinations

    @distance = JSON.parse(distance)


    @results = "$$" #@google_distance["rows"].first["elements"].first["distance"]["value"]


    @clients = Client.all
    @agents = Agent.all

  end


  def calculate_route_optimization

    a = Agent.first

    @order = route_optimization(a.address, a.address, a.route)


  end

  def show_map

    agent = Agent.first

    destination = origin = agent.address
    waypoints = agent.route


    order = route_optimization(origin, destination, waypoints)

    waypoints_optimized = []
    waypoints_optimized << order.map{|i| waypoints[i] }

    @uri = embeded_map(agent.address, agent.address, waypoints_optimized.flatten)


  end



  def clear_hash(h)
    h.map do |key, value|
      h.delete!(key) if key == "place_id"
      clear_hash(h[key]) if value.kind_of?(Enumerable)
    end
    return h
  end

end
