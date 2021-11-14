class YelpService
  class << self

    def search(zipcode)
      response = local_connection(zipcode)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      YelpPoro.create(yelp_data, zipcode)
    end

    def local_connection(**args)
        HTTParty.get(
          'api.yelp.com/v3/businesses/search',
          headers: {
            "Authorization": Figaro.env.yelp_key
          },
          params: {
            location: args[:zipcode].to_json,
            categories: "coffee",
            sort_by: "rating"
          }
        )
    end
  end
end
