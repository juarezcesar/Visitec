require 'net/http'


class AppointmentsController < ApplicationController


  def calculate_direction

    google_key = Rails.application.secrets.google_api_map_directions
    google_url = 'https://maps.googleapis.com/maps/api/directions/json?'
    google_params = {origin: 'Curitiba',
                     destination: 'Mandirituba',
                     departure_time: Time.now.to_i + 3600,
                     key: google_key}

    url = URI.parse google_url + google_params.to_query

    Rails.logger.info "Resquesting Google Map Directions: \n #{url}"

    req = Net::HTTP::Get.new(url)

    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }

    raise Exception, res.body

  end


  def calculate_distance

    google_key = Rails.application.secrets.google_api_map_matrix
    google_url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
    google_params = {origins: 'Curitiba',
                     destinations: 'Mandirituba',
                     departure_time: Time.now.to_i + 3600,
                     key: google_key}

    url = URI.parse google_url + google_params.to_query

    Rails.logger.info "Resquesting Google Map Matrix: \n #{url}"

    req = Net::HTTP::Get.new(url)

    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }

    @distance = res.body

  end




end
