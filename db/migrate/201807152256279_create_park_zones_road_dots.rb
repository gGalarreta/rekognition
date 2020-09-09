class CreateParkZonesRoadDots < ActiveRecord::Migration[5.2]
  def change
    create_table :park_zones_road_dots do |t|
      t.references    :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references    :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.references    :park_zone, primary: true, foreign_key: { to_table: :park_zones }
      t.references    :road_dot, primary: true, foreign_key: { to_table: :road_dots }

      t.timestamps
    end
  end
end
