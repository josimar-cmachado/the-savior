class AddAdressInfosToWedding < ActiveRecord::Migration[7.1]
  def change
    add_column :weddings, :address_number, :string
    add_column :weddings, :address_location, :string
  end
end
