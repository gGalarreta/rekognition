class AddMoreFieldsToParkingPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :parking_places, :width, :float
    add_column :parking_places, :height, :float
  end
end
