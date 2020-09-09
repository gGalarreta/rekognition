
require_relative '20180420153136_create_parking_levels'

class AddFieldsToParkingLevels < ActiveRecord::Migration[5.2]
  def change

    revert CreateParkingLevels

    create_table(:parking_levels) do |t|
      t.references    :parking_lot, primary: true, foreign_key: { to_table: :parking_lots }
      t.integer       :level_order
      t.string        :name
      t.string        :image, null: true
    end
  end
end
