require "rails_helper"

RSpec.describe "When a User is created on the FE" do
	after(:each) do
		CreationService.clean_up_test
		User.destroy_all
	end

	describe "Run rails s -p 3001 in backend repo before running" do
		xit "The user and session data are stored in the BE" do
			@user = FactoryBot.create(:user)
			session = {user_id: @user.id}
			response = CreationService.store_user_and_session(@user, session)
			response = JSON.parse(response.body, symbolize_names: true)

			expect(response).to be_a(Hash)
			expect(response.dig(:data, :type)).to eq("storage_log")
			expect(response.dig(:data,:attributes,:configuration,:user)).to be_a(Hash)
			expect(response.dig(:data,:attributes,:configuration,:session)).to be_a(Hash)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:first_name)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:last_name)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:address_1)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:address_2)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:city)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:state)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:zipcode)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:email)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:favorite_beverage)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:password_digest)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:username)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:created_at)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:updated_at)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:session,:user_id)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:session,:created_at)).to_not be(nil)
			expect(response.dig(:data,:attributes,:configuration,:session,:updated_at)).to_not be(nil)
		end
	end
end
