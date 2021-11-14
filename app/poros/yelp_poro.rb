class YelpPoro
  attr_reader :name,
              :image_url,
              :rating,
              :coordinates,
              :fulfillment_types,
              :location,
              :phone,
              :url
  def initialize(y)
    @name = y[:name]
    @image_url = y[:image_url]
    @rating = y[:rating]
    @coordinates = y[:coordinates]
    @fulfillment_types = y[:fulfillment_types]
    @location = y[:location]
    @phone = y[:phone]
    @url = y[:url]
  end

  class << self
    def create(data)
      require 'pry'; binding.pry
      all_stores = []
      data.each do |d|
        store = self.new(d)
        all_stores << store
      end
      all_stores
    end
  end
end
