class CurrentLocationService
  URI = "https://ipgeolocation.abstractapi.com/v1/?api_key=#{Figaro.env.api_key}"

  class << self
    def get_current_location
      response = HTTParty.get(
        URI
      )
      if response.nil?
        # Add Error Handling Here
      else
        find_postal_code(response)
      end
    end

    def find_postal_code(response)
      if response["postal_code"]
        response["postal_code"]
      else
        # Add Error Handling Here
      end
    end
  end
end
