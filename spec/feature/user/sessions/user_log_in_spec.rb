require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
	before :all do
		@user = FactoryBot.create(:user)
	end
	after :all do
		User.find(@user.id).destroy
	end

	context "When I visit the home page" do
		it "I visit the correct page when clicking Log in button" do
			visit root_path
			find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[2]/ul/a[1]').click

			expect(current_path).to eq(log_in_path)
			end
			it "The log in page asks for my email address and password" do
			visit log_in_path

			within "#log_in_form" do
				expect(page).to have_field(:email)
				expect(page).to have_field(:password)
			end
			end
			it "With correct credentials I am able to log in, redirected to root path" do
			visit log_in_path
			fill_in :email, with: @user.email
			fill_in :password, with: @user.password
			click_button "Log in"

			expect(current_path).to eq(root_path)
			expect(page).to have_content("Welcome back #{@user.username}!")
		end
	end
end
