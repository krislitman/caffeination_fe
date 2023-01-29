# frozen_string_literal: true

class CreateUsersCoffeeShopsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :coffee_shops, :users do |t|
      t.index :coffee_shop_id
      t.index :user_id
    end
  end
end
