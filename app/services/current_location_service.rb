class CurrentLocationService

	class << self
		def get_current_location
			response = HTTParty.get(
				"https://ipgeolocation.abstractapi.com/v1/?api_key=#{Figaro.env.api_key}"
			)
			code = find_postal_code(response)
			if code.nil?
				coordinates = find_lat_lon(response)
				response2 = try_open_weather(coordinates)
				if (response2.dig("cod") != "400" rescue nil)
					response2.first.dig("name") || nil
				end
			end
		end

		def try_open_weather(coordinates)
			HTTParty.get(
				"http://api.openweathermap.org/geo/1.0/reverse",
				query: {
					appid: Figaro.env.open_weather,
					lat: coordinates[:lat],
					lon: coordinates[:lon],
					limit: 1
				}
			)
		end

		def find_postal_code(response)
			if response["postal_code"]
				response["postal_code"]
			else
				nil
			end
		end

		def find_lat_lon(response)
			lat_lon = {}
			lat_lon[:lat] = response["latitude"]
			lat_lon[:lon] = response["longitude"]
			lat_lon
		end
	end
end
