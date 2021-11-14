class YelpService
  class << self

    def search(zipcode)
      zipcode = zipcode[:query].to_s
      require 'pry'; binding.pry
      response = local_connection(zipcode)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      YelpPoro.create(yelp_data, zipcode)
    end

    def local_connection(zipcode)
        HTTParty.get(
          'https://api.yelp.com/v3/businesses/search',
          headers: {
            "Authorization": Figaro.env.yelp_key
          },
          query: {
            location: zipcode,
            categories: "coffee",
            sort_by: "rating"
          }
        )
    end
  end
end
