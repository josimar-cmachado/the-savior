class CreateTips < ActiveRecord::Migration[7.1]
  def change
    create_table :tips do |t|
      t.string :title
      t.text :content
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end
