# frozen_string_literal: true

class AddColumnsToCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    add_column :coffee_shops, :hours, :string
    add_column :coffee_shops, :price, :string
    add_column :coffee_shops, :open, :boolean
  end
end
