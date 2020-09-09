class AddFieldsToMallElementsAndMallBeacons < ActiveRecord::Migration[5.2]
  def change
    add_column :mall_beacons, :location, 'point'
    add_column :mall_elements, :description, :string
  end
end
