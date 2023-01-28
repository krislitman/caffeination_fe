# frozen_string_literal: true

class CfCoffeeShop
	attr_reader :yelp_id,
              :name,
              :image_url,
              :rating,
              :coordinates,
              :transaction_types,
              :location,
              :phone,
              :url,
              :search_phrase,
              :hours,
              :price,
              :reviews

	def initialize(attributes, zipcode)
		@yelp_id = attributes[:id]
		@name = attributes[:name]
		@image_url = URI.parse(attributes[:image_url]) rescue nil
		@rating = attributes[:rating]
		@coordinates = attributes[:coordinates]
		@transaction_types = attributes[:transactions]
		@location = attributes[:location]
		@phone = attributes[:display_phone] || attributes[:phone]
		@url = attributes[:url]
		@search_phrase = zipcode
		@hours = attributes[:hours]
		@price = attributes[:price]
		@is_open = attributes[:is_closed]
		@reviews = []
	end

	def price_sort
		if @price
			@price.length
		else
			0
		end
	end

	def is_open?
		@is_open
	end

	def add_reviews(all_reviews)
		all_reviews.each do |review|
			@reviews << review
		end
	end

  # Class methods for Caffienation Coffee Shops
	class << self

    def create_coffee_shops(data, zipcode)
			if data[:businesses]
				return data[:businesses].map{ |business| CfCoffeeShop.new(business, zipcode) }
			else
				raise "Error receiving business information from Yelp, please try again later"
			end
    end

		def filter_by_starbucks(location, coffee_shops)
			coffee_shops.delete_if{ |cs| cs.name.include? "Starbucks" || "starbucks" || "Starbuck" || "starbuck"}
		end

		def filter_by_rating(coffee_shops)
			coffee_shops.sort_by{ |cf| cf.rating }.reverse!
		end

		def filter_by_price(coffee_shops)
			coffee_shops.sort_by{ |cf| cf.price_sort }.reverse!
		end
	end
end
