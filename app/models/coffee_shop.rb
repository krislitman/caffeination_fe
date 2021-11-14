class CoffeeShop < ApplicationRecord
  validates :coordinates, presence: true
  validates :transaction_types, presence: true
  validates :location, presence: true
end
