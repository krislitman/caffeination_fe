class CoffeeShopController < ApplicationController
	def show
		@coffee_shop = YelpService.get_shop(params[:yelp_id])
	end
end
