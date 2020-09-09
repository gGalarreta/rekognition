class AddFieldToRoadDotConnection < ActiveRecord::Migration[5.2]
  def change
    remove_column :road_dot_connections, :type, :integer
    add_column :road_dot_connections, :type_dot_connection, :integer
  end
end
