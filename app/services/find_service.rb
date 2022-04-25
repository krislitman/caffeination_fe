class FindService
	class << self

		def find_user_by_email(email)
			response = HTTParty.get(
				"#{Figaro.env.backend}user",
				query: {
					email: email
				}
			)
			JSON.parse(response.body, symbolize_names: true)
		end

		def find_favorite_spots(email)
			response = HTTParty.get(
				"#{Figaro.env.backend}user_favorites",
				query: {
					email: email
				}
			)
			data = JSON.parse(response.body, symbolize_names: true)[:data]
			CfFavorite.create(data)
		end

		def find_shop_favorite(yelp_id, email)
			response = HTTParty.get(
				"#{Figaro.env.backend}coffee_shop_favorite",
				query: {
					email: email,
					yelp_id: yelp_id
				}
			)
			JSON.parse(response.body, symbolize_names: true)[:message]
		end
	end
end
