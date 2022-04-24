class YelpService
	class << self

		def get_shop(yelp_id)
			response = yelp_get_shop(yelp_id)
			yelp_data = JSON.parse(response.body, symbolize_names: true)
			CfCoffeeShop.new(yelp_data, nil)
		end

		def get_reviews(yelp_id)
			response = yelp_get_reviews(yelp_id)
			JSON.parse(response.body, symbolize_names: true)
			require 'pry'; binding.pry
		end

		def search(zipcode)
			zipcode = zipcode[:query].to_s
			response = yelp_search(zipcode)
			yelp_data = JSON.parse(response.body, symbolize_names: true)
			create_coffee_shops(yelp_data, zipcode)
		end

		def create_coffee_shops(data, zipcode)
			all_stores = []
			if data[:businesses]
				data[:businesses].each do |b|
					s = CfCoffeeShop.new(b, zipcode)
					all_stores.push(s)
				end
			else
				raise "Error receiving business information from Yelp, please try again later"
			end
			all_stores
		end

		def yelp_search(zipcode)
			HTTParty.get(
				"https://api.yelp.com/v3/businesses/search",
				headers: {
					"Authorization": Figaro.env.yelp_key
				},
				query: {
					location: zipcode,
					categories: "coffee",
					sort_by: "rating"
				}
			)
		end

		def yelp_get_shop(yelp_id)
			HTTParty.get(
				"https://api.yelp.com/v3/businesses/#{yelp_id}",
				headers: {
					"Authorization": Figaro.env.yelp_key
				}
			)
		end

		def yelp_get_reviews(yelp_id)
			HTTParty.get(
				"https://api.yelp.com/v3/businesses/#{yelp_id}/reviews",
				headers: {
					"Authorization": Figaro.env.yelp_key
				}
			)
		end
	end
end
