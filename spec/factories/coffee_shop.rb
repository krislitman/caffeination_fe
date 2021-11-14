FactoryBot.define do
  factory :coffee_shop do
    sequence :name do |n|
      "#{Faker::Coffee.blend_name}-#{n}"
    end
    lat_and_lon = {latitude: 40, longitude: -80}.to_json
    coordinates { lat_and_lon }
    types = {translations: ["pickup", "delivery"]}.to_json
    transaction_types { types }
    location_field = {location: {address1: "#{Faker::Coffee.notes}", city: "#{Faker::Coffee.origin}", state: "FL"}}.to_json
    location { location_field }
  end
end
