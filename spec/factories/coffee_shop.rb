# frozen_string_literal: true

FactoryBot.define do
  factory :coffee_shop do
    sequence :name do |n|
      "#{Faker::Coffee.blend_name}-#{n}"
    end
    image_url { Faker::Internet.domain_name(domain: 'example').to_s }
    rating { Faker::Number.within(range: 1..10).to_s }
    lat_and_lon = { latitude: 40, longitude: -80 }.to_json
    coordinates { lat_and_lon }
    types = { translations: %w[pickup delivery] }.to_json
    transaction_types { types }
    location_field = { location: { address1: Faker::Coffee.notes.to_s, city: Faker::Coffee.origin.to_s,
                                   state: 'FL' } }.to_json
    location { location_field }
    search_phrase { 'Hello World' }
  end
end
