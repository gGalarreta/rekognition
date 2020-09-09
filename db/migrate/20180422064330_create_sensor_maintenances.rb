class CreateSensorMaintenances < ActiveRecord::Migration[5.2]
  def change
    
    create_table :sensor_maintenances do |t|
      t.belongs_to :parking_sensor
      t.belongs_to :parking_place
      t.belongs_to :parking_level
      t.belongs_to :parking_lot
      t.date :maintenance_date
      t.text :description
      t.string :recording_user

      t.timestamps
    end
  end
end
