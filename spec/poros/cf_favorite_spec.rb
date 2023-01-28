# frozen_string_literal: true

require "rails_helper"

RSpec.describe CfFavorite do
	before(:all) do
		raw_data = {
			attributes: {
				"yelp_id": "S5LnH1njwFBlq77tIkjI1g",
				"name": "Yolk White & Associates",
			}
		}

		@favorite = CfFavorite.new(raw_data)
	end

	context "Poros/CfFavorite" do
		it "Can be instantiated" do
			expect(@favorite).to be_an_instance_of(CfFavorite)
		end
		it "Has attributes" do
			expect(@favorite.yelp_id).to eq("S5LnH1njwFBlq77tIkjI1g")
			expect(@favorite.name).to eq("Yolk White & Associates")
		end
	end
end
