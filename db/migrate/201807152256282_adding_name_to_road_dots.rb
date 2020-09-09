class AddingNameToRoadDots < ActiveRecord::Migration[5.2]
  def change
    add_column :road_dots, :name, :string
  end
end
