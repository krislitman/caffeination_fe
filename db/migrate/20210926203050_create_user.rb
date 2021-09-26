class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email
      t.string :favorite_beverage
      t.string :password_digest
      t.string :username

      t.timestamps
    end
  end
end
