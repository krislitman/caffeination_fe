# frozen_string_literal: true

class Yelp::Search < Actor
    input :zipcode

    output :results

    def call
        response = fetch_and_convert_businesses(zipcode)
        self.results = CoffeeShop.translate_to_model(response)
    rescue StandardError => e
        fail!(error: e.message)
    end

    private

    def fetch_and_convert_businesses(zipcode)
        response = fetch_businesses(zipcode)
        json_results = JSON.parse(response.body, symbolize_names: true)
        CfCoffeeShop.create_coffee_shops(json_results, zipcode)
    end

    def fetch_businesses(zipcode, sort_by = "rating")
        HTTParty.get(
            search_url,
            headers: {
              "Authorization": yelp_api_key
            },
            query: {
              location: zipcode,
              categories: "coffee",
              sort_by: sort_by
            }
          )
    end

    def search_url
        "https://api.yelp.com/v3/businesses/search"
    end

    def yelp_api_key
        Figaro.env.yelp_key
    end
end
