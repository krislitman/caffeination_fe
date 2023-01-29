# frozen_string_literal: true

class CurrentLocationService
  class << self
    def abstract_location
      response = HTTParty.get(
        "https://ipgeolocation.abstractapi.com/v1/?api_key=#{Figaro.env.api_key}"
      )

      if postal_code = find_postal_code(response)
        postal_code
      else
        coordinates = find_lat_lon(response)
        response2 = weather_location(coordinates)

        if begin
          response2['cod'] != '400'
        rescue StandardError
          nil
        end
          response2.first['name'] || nil
        end
      end
    end

    def weather_location(coordinates)
      HTTParty.get(
        'http://api.openweathermap.org/geo/1.0/reverse',
        query: {
          appid: Figaro.env.open_weather,
          lat: coordinates[:lat],
          lon: coordinates[:lon],
          limit: 1
        }
      )
    end

    def find_postal_code(response)
      response['postal_code'] || nil
    end

    def find_lat_lon(response)
      lat_lon = {}
      lat_lon[:lat] = response['latitude']
      lat_lon[:lon] = response['longitude']
      lat_lon
    end
  end
end
