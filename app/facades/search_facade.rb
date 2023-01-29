# frozen_string_literal: true

class SearchFacade
  class << self
    def route(params, location)
      if params[:query]
        response = YelpService.search(params)
      elsif params[:sort_by]
        response = sort_options(params, location)
      end
    rescue StandardError
      unexpected_error(response)
    end

    def sort_options(params, location)
      coffee_shops = YelpService.search(get_search_params(location))
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
