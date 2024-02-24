class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :full_name
      t.string :email
      t.boolean :confirmed
      t.string :phone
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
