class AddSearchPhraseToCoffeeShop < ActiveRecord::Migration[6.1]
  def change
    add_column :coffee_shops, :search_phrase, :string
  end
end
