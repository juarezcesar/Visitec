module GoogleMapHelper


def calculate_direction


    directionsRequest = {
        origin: Client.first.address,
        destination: Agent.first.address,
        travelMode: 'DRIVING',
    }


    puts "*" * 20
    puts "DirectionRequest: #{directionsRequest}"
    puts "*" * 20

    directionStatus = direction(origin, destination)

    my_json = JSON.parse(response)
    puts my_json

    @direction = my_json
    my_hash = my_json

    #my_hash = {hello: "goodbye"}

    @json = JSON.generate(my_hash).html_safe

    puts "*" * 50
    puts @json
    puts "*" * 50


    @msg = "Buenas"


  end


end
