require "rails_helper"

RSpec.describe CFCoffeeShop do
	context "Poro" do
		it "Can be instantiated" do
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
			cf_coffee_shop = CFCoffeeShop.new(raw_data, zipcode)

			expect(cf_coffee_shop).to be_an_instance_of(CFCoffeeShop)
		end
	end
	context "Methods" do
		xit "#add_reviews(reviews)" do
		end
	end
end
