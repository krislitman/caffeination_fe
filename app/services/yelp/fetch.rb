# frozen_string_literal: true

class Yelp::Fetch < Actor
    input :yelp_id

    output :shop

    def call
        result = fetch_yelp_shop
        self.shop = result

        fetch_reviews if result
    rescue StandardError => e
        fail!(error: e.message)
    end

    private

    def fetch_yelp_shop
        response = JSON.parse(fetch_business.body, symbolize_names: true)
        CfCoffeeShop.new(response, nil)
    end

    def fetch_reviews
        response = JSON.parse(fetch_business_reviews.body, symbolize_names: true)[:reviews]
        self.shop.add_reviews(response)
    end

    def fetch_business
        HTTParty.get(
            business_url,
            headers: {
              "Authorization": yelp_api_key
            }
          )
    end

    def fetch_business_reviews
        HTTParty.get(
            review_url,
            headers: {
              "Authorization": yelp_api_key
            }
          )
    end

    def business_url
        "https://api.yelp.com/v3/businesses/#{yelp_id}"
    end

    def review_url
        "https://api.yelp.com/v3/businesses/#{yelp_id}/reviews"
    end

    def yelp_api_key
        Figaro.env.yelp_key
    end
end
