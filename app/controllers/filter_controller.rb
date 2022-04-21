class FilterController < ApplicationController
	before_action :location, only: [:index]

	def index
		@pagy, @coffee_shops = pagy_array(SearchFacade.sort_options(sort_params, location))
	end

	private

	def sort_params
		params.permit(:sort_by)
	end

	def location
		session[:location]
	end
end
