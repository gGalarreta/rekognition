class AddParkZoneTypeIdToParkZones < ActiveRecord::Migration[5.2]
  def change
    add_reference :park_zones, :park_zone_type
  end
end
