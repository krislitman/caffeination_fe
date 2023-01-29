# frozen_string_literal: true

class AddYelpIdToCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    add_column :coffee_shops, :yelp_id, :string
  end
end
