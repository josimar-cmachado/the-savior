class RemoveEmailFromGuests < ActiveRecord::Migration[7.1]
  def change
    remove_column :guests, :email, :string
  end
end
