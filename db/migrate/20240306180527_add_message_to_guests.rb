class AddMessageToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :confirmation_message, :text
  end
end
