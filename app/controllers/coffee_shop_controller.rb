class CoffeeShopController < ApplicationController
	def show
		@coffee_shop = YelpService.get_shop(params[:yelp_id])
	end

	def favorite
		coffee_shop = YelpService.get_shop(params[:format])
		user = FindService.find_user_by_email(current_user.email)
		if coffee_shop && user
			if Rails.env.development?
				user = {
					type: :user,
					event: :favorite,
					id: user.dig(:data, :id),
					email: user.dig(:data, :attributes, :email),
					coffee_shop: {
						name: coffee_shop.name,
						location: coffee_shop.location,
						rating: coffee_shop.rating,
						yelp_id: coffee_shop.yelp_id
					}
				}
				LogCreateJob.perform_later(user)
			end
			flash[:notice] = "#{coffee_shop.name} has been added to your favorite Coffee Shops!"
			redirect_to root_path
		else
			flash[:notice] = "An error occurred, please try again"
			redirect_to root_path
		end
	end
end
