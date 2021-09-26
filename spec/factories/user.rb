FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user-#{n}"
    end
    first_name {"#{Faker::Games::Pokemon.name}"}
    last_name {"#{Faker::Games::Pokemon.move}"}
    address_1 {"#{Faker::Games::Pokemon.location}"}
    sequence :address_2 do |n|
      "Apt -#{n}"
    end
    city {"#{Faker::Address.city}"}
    state {"#{Faker::Address.state_abbr}"}
    zipcode {"#{Faker::Address.zip_code}"}
    email {"#{Faker::Internet.safe_email}"}
    favorite_beverage {"#{Faker::Coffee.blend_name}"}
  end
end
