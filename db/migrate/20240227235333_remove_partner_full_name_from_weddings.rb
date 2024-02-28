class RemovePartnerFullNameFromWeddings < ActiveRecord::Migration[7.1]
  def change
    remove_column :weddings, :partner_full_name, :string
  end
end
