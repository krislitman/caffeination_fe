# frozen_string_literal: true

class SearchFacade
  class << self
    def route(zipcode)
      if zipcode
        Yelp::Search.call(zipcode: zipcode).results
      elsif params[:sort_by]
        response = sort_options(params, zipcode)
      end
    rescue StandardError
      unexpected_error(response)
    end

    def sort_options(params, location)
      search_param = get_search_params(location)

      coffee_shops = Yelp::Search.call(zipcode: search_param).results
      sort_type = params[:sort_by]
      case sort_type
      when 'No Starbucks'
        CfCoffeeShop.filter_by_starbucks(location, coffee_shops)
      when 'Rating'
        CfCoffeeShop.filter_by_rating(coffee_shops)
      when 'Price'
        CfCoffeeShop.filter_by_price(coffee_shops)
      end
    rescue StandardError
      unexpected_error(coffee_shops)
    end

    private

    def get_search_params(location)
      { query: location }
    end

    def unexpected_error(message)
      message&.errors&.full_messages
    end
  end
end
