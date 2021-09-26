require "rails_helper"

RSpec.describe User, type: :model do
  context "Validations" do
    before { FactoryBot.build(:user) }

    it do
      should validate_presence_of :first_name
    end
  end
end
