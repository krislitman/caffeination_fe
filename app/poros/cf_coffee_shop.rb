class CfCoffeeShop
  attr_reader :name,
              :image_url,
              :rating,
              :coordinates,
              :translation_types,
              :location,
              :phone,
              :url,
              :search_phrase

  def initialize(attributes, zipcode)
    @name = attributes[:name]
    @image_url = URI.parse(attributes[:image_url])
    @rating = attributes[:rating]
    @coordinates = attributes[:coordinates]
    @transaction_types = attributes[:transactions]
    @location = attributes[:location]
    @phone = attributes[:display_phone] || attributes[:phone]
    @url = attributes[:url]
    @search_phrase = zipcode
  end
end
