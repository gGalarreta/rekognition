class CreateParkingPlacesRoadDots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_places_road_dots do |t|
      t.references  :parking_place, primary: true, foreign_key: { to_table: :parking_places }
      t.references  :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references  :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.references   :road_dot_from, primary: true, foreign_key: { to_table: :road_dots }
      t.references   :road_dot_to, primary: true, foreign_key: { to_table: :road_dots }
      t.references   :road_dot_connection, primary: true, foreign_key: { to_table: :road_dot_connections }
    end
  end
end
