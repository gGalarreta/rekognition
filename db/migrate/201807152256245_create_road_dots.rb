class CreateRoadDots < ActiveRecord::Migration[5.2]
  def change
    create_table :road_dots do |t|
      t.float         :x_coord
      t.float         :y_coord
      t.references    :parking_level, foreign_key: { to_table: :parking_levels }
      t.references    :parking_lot, foreign_key: { to_table: :parking_lots }
      t.integer       :type
    end
  end
end
