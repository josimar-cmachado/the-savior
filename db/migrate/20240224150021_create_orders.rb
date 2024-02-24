class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.text :message
      t.string :full_name
      t.references :gift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
