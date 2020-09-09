class AddMoreMoreFieldsToParkingPlace < ActiveRecord::Migration[5.2]
  def change
    remove_column :parking_places, :width, :float
    remove_column :parking_places, :height, :float

    add_column :parking_places, :width, :float
    add_column :parking_places, :height, :float
  end
end
