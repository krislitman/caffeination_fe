# frozen_string_literal: true

class CoffeeShopController < ApplicationController
	def show
		@coffee_shop = YelpService.get_shop(params[:yelp_id])
		@is_favorite = FindService.find_shop_favorite(params[:yelp_id], current_user&.email)
	end

	def favorite
		coffee_shop = YelpService.get_shop(params[:format])
		user = FindService.find_user_by_email(current_user.email)
		if coffee_shop && user
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
			flash[:notice] = "#{coffee_shop.name} has been added to your favorite Coffee Shops!"
			redirect_back(fallback_location: root_path)
		else
			flash[:notice] = "An error occurred, please try again"
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		yelp_id = params[:format]
		user = FindService.find_user_by_email(current_user.email)
		if user
			response = DestroyService.destroy_favorite(user.dig(:data, :id), yelp_id)
			user = {
				type: :user,
				event: :destroy,
				id: user.dig(:data, :id),
				email: user.dig(:data, :attributes, :email),
				coffee_shop: {
					yelp_id: yelp_id
				}
			}
			LogCreateJob.perform_later(user)
			if response == "success"
				flash[:notice] = "Favorite has been removed!"
				redirect_back(fallback_location: root_path)
			else
				flash[:notice] = "An error occurred, please try again"
				redirect_back(fallback_location: root_path)
			end
		else
			flash[:notice] = "An error occurred, please try again"
			redirect_back(fallback_location: root_path)
		end
	end
end
