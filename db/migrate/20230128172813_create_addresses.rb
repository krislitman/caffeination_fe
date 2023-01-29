# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :line1
      t.string :line2
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
