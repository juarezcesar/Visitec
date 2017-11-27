require 'net/http'


class AppointmentsController < ApplicationController



  def calculate_distance

    google_key = Rails.application.secrets.google_api_map_matrix
    google_url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
    google_params = {origins: 'Curitiba', destinations: 'Mandirituba', key: google_key}

    url = URI.parse google_url + google_params.to_query

    req = Net::HTTP::Get.new(url)

    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }

    @distance = res.body


  end




end
