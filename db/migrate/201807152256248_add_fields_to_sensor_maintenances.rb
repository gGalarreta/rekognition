
require_relative '20180422064330_create_sensor_maintenances'

class AddFieldsToSensorMaintenances < ActiveRecord::Migration[5.2]
  def change

    revert CreateSensorMaintenances

    create_table(:sensor_maintenances) do |t|
      t.references    :parking_place, primary: true, foreign_key: { to_table: :parking_places }
      t.references    :parking_level, primary: true, foreign_key: { to_table: :parking_levels }
      t.references    :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.date          :maintenance_date
      t.text          :description
      t.integer       :recording_user
    end
  end
end
