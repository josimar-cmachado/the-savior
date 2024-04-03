class RemoveInfoFromWeddings < ActiveRecord::Migration[7.1]
  def change
    remove_column :weddings, :partner_phone, :string
    remove_column :weddings, :partner_email, :string
    remove_column :weddings, :partner_profile, :string
  end
end
