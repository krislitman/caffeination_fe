class CfCoffeeShop
	attr_reader :yelp_id,
				:name,
				:image_url,
				:rating,
				:coordinates,
				:translation_types,
				:location,
				:phone,
				:url,
				:search_phrase,
				:hours,
				:reviews

	def initialize(attributes, zipcode)
		@yelp_id = attributes[:id]
		@name = attributes[:name]
		@image_url = URI.parse(attributes[:image_url])
		@rating = attributes[:rating]
		@coordinates = attributes[:coordinates]
		@transaction_types = attributes[:transactions]
		@location = attributes[:location]
		@phone = attributes[:display_phone] || attributes[:phone]
		@url = attributes[:url]
		@search_phrase = zipcode
		@hours = attributes[:hours]
		@reviews = []
	end

	def add_reviews(all_reviews)
		all_reviews.each do |review|
			@reviews << review
		end
	end

	class << self

		def filter_by_starbucks(location, coffee_shops)
			coffee_shops = coffee_shops.delete_if{ |cs| cs.name.include? "Starbucks" || "starbucks" || "Starbuck" || "starbuck"}
			coffee_shops
		end
	end
end
