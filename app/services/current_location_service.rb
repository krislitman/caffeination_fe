class CurrentLocationService
	URI = "https://ipgeolocation.abstractapi.com/v1/?api_key=#{Figaro.env.api_key}"

	class << self
		def get_current_location
			response = HTTParty.get(
				URI
			)
			find_postal_code(response)
		end

		def find_postal_code(response)
			if response["postal_code"]
				response["postal_code"]
			else
				# logger.debug "Postal Code not found in Response"
			end
		end
	end
end
