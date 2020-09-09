class CreateParkZoneDots < ActiveRecord::Migration[5.2]
  def change
    create_table :park_zone_dots do |t|
      t.references      :park_zone, primary: true, foreign_key: { to_table: :park_zones }
      t.references      :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references      :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.float           :x_coord
      t.float           :y_coord
      t.integer         :order_zone_dot
    end
  end
end
