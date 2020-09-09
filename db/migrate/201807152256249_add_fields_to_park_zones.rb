class AddFieldsToParkZones < ActiveRecord::Migration[5.2]
  def change
    add_column :park_zones, :x_coord, :float
    add_column :park_zones, :y_coord, :float
    add_column :park_zones, :height, :float
    add_column :park_zones, :width, :float
    add_column :park_zones, :image, :string, null: true
  end
end
