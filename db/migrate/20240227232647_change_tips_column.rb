class ChangeTipsColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :weddings, :tips, :text
  end
end
