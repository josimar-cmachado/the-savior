class AddCoordinatesToWeddings < ActiveRecord::Migration[7.1]
  def change
    add_column :weddings, :latitude, :float
    add_column :weddings, :longitude, :float
  end
end
