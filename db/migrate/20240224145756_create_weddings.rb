class CreateWeddings < ActiveRecord::Migration[7.1]
  def change
    create_table :weddings do |t|
      t.text :welcome_message
      t.string :address
      t.text :wedding_info
      t.string :tips
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
