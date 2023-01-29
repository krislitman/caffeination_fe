# frozen_string_literal: true

class CreateCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_shops do |t|
      t.string :name, null: false
      t.string :image_url, null: true
      t.float :rating, null: true
      t.jsonb :coordinates, null: false, default: '{}'
      t.jsonb :transaction_types, null: false, default: '{}'
      t.jsonb :location, null: false, default: '{}'
      t.string :phone, null: true
      t.string :url, null: true

      t.timestamps
    end
  end
end
