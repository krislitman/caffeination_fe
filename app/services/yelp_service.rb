class YelpService
  class << self

    def search(zipcode)
      zipcode = zipcode[:query].to_s
      response = local_connection(zipcode)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      create_coffee_shops(yelp_data)
    end

    def create_coffee_shops(data)
      all_stores = []
      if data[:businesses]
        data[:businesses].each do |b|
          s = CoffeeShop.new({
            name: b[:name],
            image_url: URI.parse(b[:image_url]),
            rating: b[:rating],
            coordinates: b[:coordinates],
            transaction_types: b[:transactions],
            location: b[:location],
            phone: b[:display_phone] ||= b[:phone],
            url: b[:url]
          })
          if s.save
              all_stores << s
          end
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
