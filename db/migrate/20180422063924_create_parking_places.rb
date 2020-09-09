class CreateParkingPlaces < ActiveRecord::Migration[5.2]
  def change
    
    create_table :parking_places do |t|
      t.belongs_to :parking_level
      t.belongs_to :parking_lot
      t.integer :x_coord
      t.integer :y_coord
      t.boolean :position
      t.belongs_to :park_zone
      t.text :state
      t.timestamps
    end
  end
end
