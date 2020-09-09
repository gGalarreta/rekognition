class RemoveTypeFromParkZonesRoadDots < ActiveRecord::Migration[5.2]
  def change
    remove_column :road_dots, :type, :integer
    add_column :road_dots, :type_dot, :integer
  end
end
