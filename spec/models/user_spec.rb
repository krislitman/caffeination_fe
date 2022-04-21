require "rails_helper"

RSpec.describe User, type: :model do
	context "Validations" do
		before { FactoryBot.build(:user) }

		it do
			should validate_presence_of :first_name
			should validate_presence_of :last_name
			should validate_presence_of :username
			should validate_presence_of :zipcode
			should validate_presence_of :email
		end
	end
end
