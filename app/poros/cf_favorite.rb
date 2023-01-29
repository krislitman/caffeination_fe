# frozen_string_literal: true

class CfFavorite
  attr_reader :name,
              :yelp_id

  def initialize(attributes)
    @name = attributes.dig(:attributes, :name)
    @yelp_id = attributes.dig(:attributes, :yelp_id)
  end

  class << self
    def create(data)
      data.map do |shop|
        CfFavorite.new(shop)
      end
    end
  end
end
