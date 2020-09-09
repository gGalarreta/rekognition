class CreateParkingLots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lots do |t|
      t.text    :description
      t.integer :n_levels
      t.integer :x_size
      t.integer :y_size
      t.timestamps
    end
  end
end
