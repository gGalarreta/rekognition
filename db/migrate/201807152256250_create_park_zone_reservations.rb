class CreateParkZoneReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :park_zone_reservations do |t|
      t.references  :park_zone, primary: true, foreign_key: { to_table: :park_zones }
      t.references  :user, primary: true, foreign_key: { to_table: :users }
      t.date        :start_time
      t.date        :end_time
      t.integer     :state
    end
  end
end
