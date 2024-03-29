# frozen_string_literal: true

class YelpService
  class << self
    def get_shop(yelp_id)
      response = yelp_get_shop(yelp_id)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      shop = CfCoffeeShop.new(yelp_data, nil)

      if shop
        response_two = yelp_get_reviews(yelp_id)
        parsed = JSON.parse(response_two.body, symbolize_names: true)[:reviews]
        shop.add_reviews(parsed)
        shop
      end
    end

    def search(zipcode)
      zipcode = zipcode[:query].to_s
      response = yelp_search(zipcode)
      yelp_data = JSON.parse(response.body, symbolize_names: true)
      coffee_shops = CfCoffeeShop.create_coffee_shops(yelp_data, zipcode)

      CoffeeShop.translate_to_model(coffee_shops)
    end

    def yelp_search(zipcode)
      HTTParty.get(
        'https://api.yelp.com/v3/businesses/search',
        headers: {
          "Authorization": Figaro.env.yelp_key
        },
        query: {
          location: zipcode,
          categories: 'coffee',
          sort_by: 'rating'
        }
      )
    end

    def yelp_get_shop(yelp_id)
      HTTParty.get(
        "https://api.yelp.com/v3/businesses/#{yelp_id}",
        headers: {
          "Authorization": Figaro.env.yelp_key
        }
      )
    end

    def yelp_get_reviews(yelp_id)
      HTTParty.get(
        "https://api.yelp.com/v3/businesses/#{yelp_id}/reviews",
        headers: {
          "Authorization": Figaro.env.yelp_key
        }
      )
    end
  end
end
