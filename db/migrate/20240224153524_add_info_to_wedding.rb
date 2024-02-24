class AddInfoToWedding < ActiveRecord::Migration[7.1]
  def change
    add_column :weddings, :partner_full_name, :string
    add_column :weddings, :partner_email, :string
    add_column :weddings, :partner_profile, :string
    add_column :weddings, :partner_phone, :string
  end
end
