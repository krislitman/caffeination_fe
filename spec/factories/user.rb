# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user-#{n}"
    end
    first_name { Faker::Games::Pokemon.name.to_s }
    last_name { Faker::Games::Pokemon.move.to_s }
    address_1 { Faker::Games::Pokemon.location.to_s }
    sequence :address_2 do |n|
      "Apt-#{n * 5}"
    end
    city { Faker::Address.city.to_s }
    state { Faker::Address.state_abbr.to_s }
    zipcode { Faker::Address.zip_code.to_s }
    email { Faker::Internet.safe_email.to_s }
    favorite_beverage { Faker::Coffee.blend_name.to_s }
    password { 'test123' }

    trait(:with_coffee_shops) do
      after(:build) do |user|
        FactoryBot.create_list(:coffee_shop, rand(2..10)).each do |coffee_shop|
          user.coffee_shops << coffee_shop
        end
      end
    end
  end
end
