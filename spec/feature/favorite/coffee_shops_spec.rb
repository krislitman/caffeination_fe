require "rails_helper"

RSpec.describe "As a visitor who searched for Coffee Shops in their location", type: :feature do
	before(:all) do
		@user = create(:user)
	end

    after(:all) do
		User.destroy_all
        CoffeeShop.destroy_all
    end

    describe "On The Search Results Page" do
        it "I see a link to the Coffee Shop show pages" do
            VCR.use_cassette('requests/favorite_coffee_shop_1',
            match_requests_on: %i[body]) do
                visit root_path
				within("#zipcode_search") do
					fill_in :query, with: "33602"
					click_button "Search for Coffee Spots"
				end

                expect(current_path).to eq(search_path)
				expect(page).to have_link("Ginger Beard Coffee")
				click_link("Ginger Beard Coffee")

				expect(page).to have_content("Ginger Beard Coffee")
            end
        end
    end
end
