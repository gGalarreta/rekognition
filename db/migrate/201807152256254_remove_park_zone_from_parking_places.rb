class RemoveParkZoneFromParkingPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :parking_places, :park_zone, foreign_key: true
    add_reference :park_zones, :parking_level, foreign_key: true, primary: true
    remove_column :parking_places, :park_zone_id_id
  end
end
