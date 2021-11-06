require "rails_helper"

RSpec.describe "When a User is created on the FE" do
  it "The user and session data are stored in the BE" do
    @user = FactoryBot.create(:user)
    session = {user_id: @user.id}
    response = CreationService.store_user_and_session(@user, session)

    expect(response).to be_a(Hash)
  end
end
