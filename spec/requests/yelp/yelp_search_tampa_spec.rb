require "rails_helper"

RSpec.describe "Yelp API call initial test", type: :feature do
  describe "A guest can enter a zipcode into form" do
    it "Can search for local coffee shops" do
      visit root_path
      fill_in :query, with: "33602"
      click_button "Search"

      expect(current_path).to eq(shops_path)
      expect(page).to have_content("Coffee Shops near 33602")
    end
  end
end
