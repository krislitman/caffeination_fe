# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Filter Results without Starbucks", type: :feature do
    after(:each) do
        CoffeeShop.destroy_all
    end

    describe "A guest can adjust results removing any Starbucks results" do
        it "By Coffee Shop Rating" do
            VCR.use_cassette('requests/filter_by_no_starbucks',
            match_requests_on: %i[body]) do
                visit root_path
				within("#zipcode_search") do
					fill_in :query, with: "20149"
					click_button "Search for Coffee Spots"
				end
                expect(page).to have_content("Starbucks")
                select "No Starbucks", from: :sort_by
                click_button "Filter"
                expect(current_path).to eq(filter_path)
                within(".filtered_coffee_shops") do
                    expect(page).not_to have_content("Starbucks")
                    expect(page).not_to have_content("starbucks")
                    expect(page).not_to have_content("starbuck")
                    expect(page).not_to have_content("Starbuck")
                end
            end
        end
    end
end
