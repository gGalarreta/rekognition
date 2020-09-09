class CreateParkingPlaceUpdatesSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_place_updates_sessions do |t|
      t.references  :session, primary: true, foreign_key: { to_table: :sessions }
      t.references  :user, primary: true, foreign_key: { to_table: :users }
      t.references  :parking_place, primary: true, foreign_key: { to_table: :parking_places }
      t.references  :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references  :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.integer     :new_state
    end
  end
end
