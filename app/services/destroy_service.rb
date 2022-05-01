class DestroyService
	class << self

		def destroy_favorite(user_id, yelp_id)
			response = HTTParty.delete(
				"#{Figaro.env.backend}favorite",
				query: {
					user_id: user_id,
					yelp_id: yelp_id
				}
			)
			JSON.parse(response.body, symbolize_names: true)[:message]
		end
	end
end
