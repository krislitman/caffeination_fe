class CoffeeShop
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
    @transaction_types = y[:transactions]
    @location = y[:location]
    @phone = y[:display_phone] ||= y[:phone]
    @url = y[:url]
  end

  class << self
    def create(data)
      all_stores = []
      if data[:businesses]
        data[:businesses].each do |business|
          s = self.new(business)
          all_stores << s
        end
      end
      all_stores
    end
  end
end
