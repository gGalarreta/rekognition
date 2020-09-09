class AddFieldsToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :image_width, :integer
    add_column :maps, :image_height, :integer
  end
end
