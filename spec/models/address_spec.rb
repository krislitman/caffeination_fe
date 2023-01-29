# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { build :address }

  it 'Has a valid factory' do
    expect(subject).to be_valid
  end

  context 'Validations' do
    it { validate_presence_of :line1 }
    it { validate_presence_of :postal_code }
    it { validate_presence_of :country }
  end

  context 'Relationships' do
    it { belong_to :user }
  end
end
