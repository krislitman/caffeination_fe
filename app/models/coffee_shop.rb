# frozen_string_literal: true

require 'open-uri'

class CoffeeShop < ApplicationRecord
  has_and_belongs_to_many :users

  has_one_attached :yelp_image

  before_save :attach_yelp_image

  validates :coordinates, presence: true
  validates :location, presence: true

  def attach_yelp_image
    return if image_url.nil?

    filename = image_url
    downloaded_image = URI.open image_url

    yelp_image.attach(io: downloaded_image, filename: filename)
  end

  def formatted_location
    location['display_address'].join(' ')
  end

  class << self
    def filter_by_rating(location)
      all.where(search_phrase: location).order(rating: :desc)
    end

    def translate_to_model(coffee_shops)
      results = []

      CoffeeShop.transaction do
        coffee_shops.each do |cf|
          coffee_shop = CoffeeShop.find_by_yelp_id cf.yelp_id

          coffee_shop ||= CoffeeShop.find_or_create_by(
            name: cf.name,
            coordinates: cf.coordinates,
            location: cf.location,
            image_url: cf.image_url.to_s,
            rating: cf.rating,
            transaction_types: cf.transaction_types,
            phone: cf.phone,
            url: cf.url,
            search_phrase: cf.search_phrase,
            yelp_id: cf.yelp_id,
            open: cf.is_open?,
            price: cf.price,
            hours: cf.hours
          )
          results << coffee_shop
        end
      end

      results
    end
  end
end
