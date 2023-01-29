# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address_1, null: true
      t.string :address_2, null: true
      t.string :city, null: true
      t.string :state, null: true
      t.string :zipcode, limit: 15
      t.string :email, unique: true, null: false
      t.string :favorite_beverage, null: true
      t.string :password_digest
      t.string :username, null: false

      t.timestamps
    end
  end
end
