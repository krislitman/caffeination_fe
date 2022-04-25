class CoffeeShopController < ApplicationController
	def show
		@coffee_shop = YelpService.get_shop(params[:yelp_id])
	end

	def favorite
		require 'pry'; binding.pry
	end
end
