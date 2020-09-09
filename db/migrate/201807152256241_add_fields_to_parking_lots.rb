require_relative '20180420140139_create_parking_lots'

class AddFieldsToParkingLots < ActiveRecord::Migration[5.2]
  def change

    revert CreateParkingLots

    create_table(:parking_lots) do |t|
      t.text          :description
      t.string        :name
      t.integer       :n_levels
      t.string        :image , null: true
    end
  end
end
