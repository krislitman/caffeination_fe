require "rails_helper"

RSpec.describe "As a logged in user", type: :feature do
  before :all do
    @user = FactoryBot.create(:user)
    log_in(@user)
  end
  after :all do
    User.find(@user.id).destroy
  end
  context "When I visit the home page" do
    it "I can log out after clicking the button" do
      visit root_path
      click_button "Log out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You have been logged out")
    end
  end
end
