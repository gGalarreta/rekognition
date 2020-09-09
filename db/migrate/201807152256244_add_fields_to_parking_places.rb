
require_relative '20180422063924_create_parking_places'

class AddFieldsToParkingPlaces < ActiveRecord::Migration[5.2]
  def change

    revert CreateParkingPlaces

    create_table(:parking_places) do |t|
      t.references    :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references    :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.float         :x_coord
      t.float         :y_coord
      t.references    :park_zone_id, foreign_key: { to_table: :park_zones }
      t.integer       :state
      t.integer       :sensor_id, null: true
      t.float         :angle
    end
  end
end
