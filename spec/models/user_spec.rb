# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  context 'Validations' do
    it { validate_presence_of :first_name }
    it { validate_presence_of :last_name }
    it { validate_presence_of :username }
    it { validate_presence_of :email }
  end

  context 'Methods' do
    it '#normalize_attributes' do
      first_name = 'cait'
      last_name = 'breviario'
      email = 'EXAMPLE@eXaMpLe.com'

      expect(first_name.titleize).to eq('Cait')
      expect(last_name.titleize).to eq('Breviario')
      expect(email.downcase).to eq('example@example.com')
    end
  end
end
