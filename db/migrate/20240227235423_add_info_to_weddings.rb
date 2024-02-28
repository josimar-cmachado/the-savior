class AddInfoToWeddings < ActiveRecord::Migration[7.1]
  def change
    add_column :weddings, :partner_first_name, :string
    add_column :weddings, :partner_last_name, :string
  end
end
