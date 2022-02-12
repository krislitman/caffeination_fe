require "rails_helper"

RSpec.describe "Filter Search Results by Rating", type: :feature do
  after(:each) do
    CoffeeShop.destroy_all
  end
  describe "A guest can filter returned by their search" do
    it "By Coffee Shop Rating" do
      VCR.use_cassette('requests/filter_by_rating',
        match_requests_on: %i[body]) do
        visit root_path
        fill_in :query, with: "15243"
        find(:xpath, "/html/body/div[1]/main/div[1]/form/button").click
        select "Rating", from: :sort_by
        click_button "Filter"

        expect(current_path).to eq(filter_path)
      end
    end
  end
end
