# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    user
    line1 { Faker::Address.street_address }
    line2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    postal_code { Faker::Address.zip_code }
    state { Faker::Address.state }
    country { Faker::Address.country_code }
  end
end
