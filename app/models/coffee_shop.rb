class CoffeeShop < ApplicationRecord
	validates :coordinates, presence: true
	validates :transaction_types, presence: true
	validates :location, presence: true
	validates :search_phrase, presence: true

	class << self

		def filter_by_rating(location)
			all.where(search_phrase: location).order(rating: :desc)
		end
	end
end
