require "rails_helper"

RSpec.describe User, type: :model do
	context "Validations" do
		before { FactoryBot.build(:user) }

		it do
			should validate_presence_of :first_name
			should validate_presence_of :last_name
			should validate_presence_of :username
			should validate_presence_of :email
		end
	end
	context "Methods" do
		it "#normalize_attributes" do
			first_name = "cait"
			last_name = "breviario"
			email = "EXAMPLE@eXaMpLe.com"

			expect(first_name.titleize).to eq("Cait")
			expect(last_name.titleize).to eq("Breviario")
			expect(email.downcase).to eq("example@example.com")
		end
	end
end
