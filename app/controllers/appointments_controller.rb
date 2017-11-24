require 'net/http'


class AppointmentsController < ApplicationController



  def calculate_distance

    google_key = 'AIzaSyCyiJTAsYyAGaJ5LV73kIiLbKqWEIWZw7c'

    url = URI.parse "https://maps.googleapis.com/maps/api/distancematrix/json?origins=Curitiba&destinations=Mandirituba&key=AIzaSyCyiJTAsYyAGaJ5LV73kIiLbKqWEIWZw7c"

    req = Net::HTTP::Get.new(url)


    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }



    @distance = res.body


  end




end
