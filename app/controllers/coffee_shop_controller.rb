class CoffeeShopController < ApplicationController
	def show
		@coffee_shop = YelpService.get_shop(params[:yelp_id])
		@reviews = YelpService.get_reviews(params[:yelp_id])
		require 'pry'; binding.pry
	end
end
