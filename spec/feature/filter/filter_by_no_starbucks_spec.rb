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
        fill_in :query, with: "20149"
        find(:xpath, "/html/body/div[1]/main/div[1]/form/button").click
        expect(page).to have_content("Starbucks")
        # select "No Starbucks", from: :sort_by
        # click_button "Filter"

        expect(current_path).to eq(search_path)
      end
    end
  end
end
