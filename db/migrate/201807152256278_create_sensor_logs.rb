class CreateSensorLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :sensor_logs do |t|
      t.integer :sensor_id
      t.integer :status
      t.timestamps
    end
  end
end
