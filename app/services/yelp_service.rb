class YelpService
  class << self

    def search(zipcode)
      zipcode = zipcode[:query].to_s
      response = local_connection(zipcode)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      create_coffee_shops(yelp_data, zipcode)
    end

    def create_coffee_shops(data, zipcode)
      all_stores = []
      if data[:businesses]
        data[:businesses].each do |b|
          s =CfCoffeeShop.new(b, zipcode)
          all_stores.push(s)
        end
      else
        raise "Error receiving business information from Yelp, please try again later"
      end
      all_stores
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
