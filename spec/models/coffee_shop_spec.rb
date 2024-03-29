# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoffeeShop, type: :model do
  context 'Validations' do
    before(:all) { build :coffee_shop }

    it { validate_presence_of :coordinates }
    it { validate_presence_of :location }
  end

  xcontext 'Methods' do
    it '#filter_by_rating' do
      shops = create_list(:coffee_shop, 10)
      sorted = CoffeeShop.filter_by_rating(shops.first.search_phrase)

      expect(sorted.size).to eq(10)
      expect(sorted.first.rating).to be > sorted.last.rating
    end
  end
end
