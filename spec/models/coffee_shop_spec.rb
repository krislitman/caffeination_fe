require "rails_helper"

RSpec.describe CoffeeShop, type: :model do
	context "Validations" do
		before { FactoryBot.build(:coffee_shop) }

		it do
			should validate_presence_of :coordinates
			should validate_presence_of :transaction_types
			should validate_presence_of :location
		end
	end
end
