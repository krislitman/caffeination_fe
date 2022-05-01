require "rails_helper"

RSpec.describe CfCoffeeShop do
	before(:all) do
		raw_data = {
			"id": "S5LnH1njwFBlq77tIkjI1g",
			"alias": "yolk-white-and-associates-tampa",
			"name": "Yolk White & Associates",
			"image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/xQCa0PdWcpbh_4yX9yR7iQ/o.jpg",
			"is_closed": false,
			"url": "https://www.yelp.com/biz/yolk-white-and-associates-tampa?adjust_creative=nDIAuy1o_G4lHcbBlhCwTg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=nDIAuy1o_G4lHcbBlhCwTg",
			"review_count": 232,
			"categories": [{"alias": "foodtrucks", "title": "Food
			Trucks"}, {"alias": "coffee", "title": "Coffee & Tea"}, {"alias": "breakfast_brunch",
			"title": "Breakfast & Brunch"}],
			"rating": 5.0,
			"coordinates": {"latitude":
			27.9454650532963, "longitude": -82.4588141217828},
			"transactions": ["delivery",
			"pickup"],
			"price": "$",
			"location": {"address1": "100 N Ashley Dr", "address2":
			"", "address3": "", "city": "Tampa", "zip_code": "33602", "country": "US",
			"state": "FL", "display_address": ["100 N Ashley Dr", "Tampa, FL 33602"]},
			"phone": "+18134538256",
			"display_phone": "(813) 453-8256",
			"distance": 521.4754398515104
		}
		zipcode = 12345
		@cf_coffee_shop = CfCoffeeShop.new(raw_data, zipcode)
	end

	context "Poros/CfCoffeeShop" do
		it "Can be instantiated" do
			expect(@cf_coffee_shop).to be_an_instance_of(CfCoffeeShop)
		end
		it "Has attributes" do
			expect(@cf_coffee_shop.yelp_id).to eq("S5LnH1njwFBlq77tIkjI1g")
			expect(@cf_coffee_shop.name).to eq("Yolk White & Associates")
			expect(@cf_coffee_shop.image_url.to_s).to eq("https://s3-media2.fl.yelpcdn.com/bphoto/xQCa0PdWcpbh_4yX9yR7iQ/o.jpg")
			expect(@cf_coffee_shop.rating).to eq(5.0)
			expect(@cf_coffee_shop.coordinates).to eq({:latitude=>27.9454650532963, :longitude=>-82.4588141217828})
			expect(@cf_coffee_shop.transaction_types).to eq(["delivery", "pickup"])
			expect(@cf_coffee_shop.location).to eq({:address1=>"100 N Ashley Dr",
				:address2=>"",
				:address3=>"",
				:city=>"Tampa",
				:zip_code=>"33602",
				:country=>"US",
				:state=>"FL",
				:display_address=>["100 N Ashley Dr", "Tampa, FL 33602"]})
			expect(@cf_coffee_shop.phone).to eq("(813) 453-8256")
			expect(@cf_coffee_shop.url).to eq("https://www.yelp.com/biz/yolk-white-and-associates-tampa?adjust_creative=nDIAuy1o_G4lHcbBlhCwTg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=nDIAuy1o_G4lHcbBlhCwTg")
			expect(@cf_coffee_shop.search_phrase).to eq(12345)
			expect(@cf_coffee_shop.hours).to be_nil
			expect(@cf_coffee_shop.reviews).to eq([])
		end
	end
	context "Methods" do
		it "#add_reviews(reviews)" do
			review1 = {name: "Guy", review: "Thats great"}
			review2 = {name: "Girl", review: "Thats also great"}
			reviews = [review1, review2]
			@cf_coffee_shop.add_reviews(reviews)

			expect(@cf_coffee_shop.reviews.length).to eq(2)
		end
		it "#closed?" do
			expect(@cf_coffee_shop.is_open?).to be false
		end
	end
end
