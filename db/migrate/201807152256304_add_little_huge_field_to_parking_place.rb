class AddLittleHugeFieldToParkingPlace < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_places, :width
    remove_column :parking_places, :height

    add_column :parking_places, :width, :float
    add_column :parking_places, :height, :float
  end
end
