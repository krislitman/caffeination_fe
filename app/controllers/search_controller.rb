class SearchController < ApplicationController
	before_action :location, only: [:index]

	def index
		begin
			@pagy, @coffee_shops = pagy_array(SearchFacade.route(search_params, location))
		rescue
			redirect_to root_path(current_location: "Please try a different location!")
		end
	end

	private

	def location
		if params[:query]
			session[:location] = params[:query]
		else
			session[:location]
		end
	end

	def search_params
		params.permit(:query, :sort_by, :price)
	end
end
