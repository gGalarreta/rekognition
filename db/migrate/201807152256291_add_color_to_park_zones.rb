class AddColorToParkZones < ActiveRecord::Migration[5.2]
  def change
    add_column :park_zones, :color, :string
  end
end
