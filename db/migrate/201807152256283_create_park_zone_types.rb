class CreateParkZoneTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :park_zone_types do |t|
      t.integer :reserved
      t.string  :name
      t.string  :description 
    end
  end
end
