require 'net/http'



class AppointmentsController < ApplicationController

  include DeviseWhitelistConcern
  include GoogleConcern

  def show_map
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
    agents = Agent.all
    waypoints = agents[0].route + agents[1].route


    response = route_optimization(agents.first.address, agents.first.address, waypoints)

    @route = JSON.parse(response)
    clear_hash(@route["geocoded_waypoints"])

  end

  def clear_hash(h)
    h.map do |key, value|
      h.delete!(key) if key == "place_id"
      clear_hash(h[key]) if value.kind_of?(Enumerable)
    end
    return h
  end

end
