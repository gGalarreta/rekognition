class CreateMallBeacons < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_beacons do |t|
      t.references    :map, foreign_key: { to_table: :maps }
      t.references    :mall_level, foreign_key: { to_table: :mall_levels }
      t.text          :description
      t.string        :uuid
      t.string        :major
      t.string        :minor
      t.integer       :rssi_per_meter
      t.integer       :power
      t.timestamps
    end
  end
end
