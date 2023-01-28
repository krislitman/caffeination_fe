# frozen_string_literal: true

class SearchFacade
	class << self
		def route(params, location)
			begin
				case
				when params[:query]
					response = YelpService.search(params)
				when params[:sort_by]
					response = sort_options(params, location)
				end
			rescue
				unexpected_error(response)
			end
		end

		def sort_options(params, location)
			begin
				coffee_shops = YelpService.search(get_search_params(location))
				sort_type = params[:sort_by]
				case
				when sort_type == "No Starbucks"
					CfCoffeeShop.filter_by_starbucks(location, coffee_shops)
				when sort_type == "Rating"
					CfCoffeeShop.filter_by_rating(coffee_shops)
				when sort_type == "Price"
					CfCoffeeShop.filter_by_price(coffee_shops)
				end
			rescue
				unexpected_error(coffee_shops)
			end
		end

		private

		def get_search_params(location)
			{query: location}
		end

		def unexpected_error(message)
			if !message.nil?
				message.errors.full_messages
			end
		end
	end
end
