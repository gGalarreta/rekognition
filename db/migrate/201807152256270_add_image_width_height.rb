class AddImageWidthHeight < ActiveRecord::Migration[5.2]
  def change

    add_column :road_dot_connections, :type, :integer

    add_reference :park_zones, :parking_lot, foreign_key: true, primary: true

    add_column :parking_levels, :image_width, :float
    add_column :parking_levels, :image_height, :float

    add_column :park_zones, :image_width, :float
    add_column :park_zones, :image_height, :float

  end
end
