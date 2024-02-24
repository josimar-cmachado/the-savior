class CreateGifts < ActiveRecord::Migration[7.1]
  def change
    create_table :gifts do |t|
      t.string :title
      t.string :category
      t.integer :value
      t.integer :total_quota
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
