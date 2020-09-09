class CreateParkingLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_levels do |t|
      t.belongs_to :parking_lot
      t.integer    :value
      t.attachment :image
      t.timestamps
    end
  end
end
