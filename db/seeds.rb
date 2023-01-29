# frozen_string_literal: true

# Seed file to get a basic development setup going

# Create Users with CoffeeShops & Addresses
100.times do |_i|
  user = FactoryBot.create :user, :with_coffee_shops
  FactoryBot.create :address, user: user
end
