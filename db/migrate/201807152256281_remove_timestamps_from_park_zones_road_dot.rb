class RemoveTimestampsFromParkZonesRoadDot < ActiveRecord::Migration[5.2]
  def change
    remove_column :park_zones_road_dots, :created_at, :datetime
    remove_column :park_zones_road_dots, :updated_at, :datetime
  end
end
