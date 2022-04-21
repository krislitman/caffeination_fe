class SearchFacade
	class << self

		def route(params, location)
			begin
				case
				when params[:query]
				YelpService.search(params)
				when params[:sort_by]
				sort_options(params, location)
				end
			rescue
				unexpected_error
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
					CoffeeShop.filter_by_rating(location)
				end
			rescue
				unexpected_error
			end
		end

		private

		def get_search_params(location)
			{query: location}
		end

		def unexpected_error
			raise "An error has occurred"
		end
	end
end
