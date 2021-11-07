require "rails_helper"

RSpec.describe "When a User is created on the FE" do
  after(:each) do
    # CreationService.clean_up
    User.destroy_all
  end
  describe "Run rails s -p 3001 in backend repo before running" do
    it "The user and session data are stored in the BE" do
      @user = FactoryBot.create(:user)
      session = {user_id: @user.id}
      response = CreationService.store_user_and_session(@user, session)
      response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_a(Hash)
      expect(response.dig(:data, :type)).to eq("storage_log")
      expect(response.dig(:data,:attributes,:configuration,:user)).to be_a(Hash)
      expect(response.dig(:data,:attributes,:configuration,:session)).to be_a(Hash)
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:first_name)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:last_name)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:address_1)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:address_2)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:city)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:state)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:zipcode)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:email)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:favorite_beverage)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:password_digest)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:username)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:created_at)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:user,:configuration,:updated_at)).to not_be_not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:session,:user_id)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:session,:created_at)).to not_be_nil
      expect(response.dig(:data,:attributes,:configuration,:session,:updated_at)).to not_be_nil
    end
  end
end
