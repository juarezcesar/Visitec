module GoogleConcern
  extend  ActiveSupport::Concern
  require 'json'

  GOOGLE_URL = 'https://maps.googleapis.com/maps/api/'

  def distance(origins, destinations, departure_time = Time.now)

    google_origins = origins
    google_destinations = destinations

    google_origins = a_to_uri_params(origins) if origins.kind_of?(Array)
    google_destinations = a_to_uri_params(destinations) if destinations.kind_of?(Array)

    puts google_origins
    puts google_destinations

    google_key = Rails.application.secrets.google_api_map_matrix
    google_path = 'distancematrix/json?'
    google_params = {origins: google_origins,
                     destinations: google_destinations,
                     departure_time: departure_time.to_i,
                     key: google_key}

    url = URI.parse GOOGLE_URL + google_path + google_params.to_query


    Rails.logger.info "Resquesting Google Map Matrix: \n #{url}"

    req = Net::HTTP::Get.new(url)

    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }

    return  res.body

  end

def route_optimization(origin, destination, waypoints = [])

    #https://maps.googleapis.com/maps/api/directions/json?origin=Adelaide,SA&destination=Adelaide,SA&waypoints=optimize:true|Barossa+Valley,SA|Clare,SA|Connawarra,SA|McLaren+Vale,SA&key=AIzaSyBN2kBYDqmYnGSEA_XBK4GH0-V__h2Hz_U

    waypoints = a_to_uri_params(waypoints) unless waypoints.empty?

    google_key = Rails.application.secrets.google_api_map_matrix
    google_path = 'directions/json?'
    google_params = {origin: origin,
                     destination: destination,
                     waypoints: "optimize:true|" + waypoints,
                     key: google_key}

    url = URI.parse GOOGLE_URL + google_path + google_params.to_query

    Rails.logger.info "Resquesting Google Map Directoins: \n #{url}"

    req = Net::HTTP::Get.new(url)

    res = Net::HTTP.start(url.host, url.port,:use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) { |http|
      http.request(req)
    }

    return  res.body

  end

  def embeded_map
  #https://www.google.com/maps/embed/v1/place?key=AIzaSyDGCAVFl_cfm8s6vAj5fDhKy9AsQ9HHFy0&q=Fairmont+Empress,Victoria+BC%20&attribution_source=Google+Maps+Embed+API%20&attribution_web_url=http://www.fairmont.com/empress-victoria/%20&attribution_ios_deep_link_id=comgooglemaps://?daddr=Fairmont+Empress,+Victoria,+BC
  end

  def a_to_uri_params(params)
    url_params = ""
    params.each {|e| url_params << e + "|" }
    return url_params.chop
  end




end



