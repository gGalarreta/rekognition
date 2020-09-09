class CreateRoadDotConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :road_dot_connections do |t|
      t.references   :road_dot_from, primary: true, foreign_key: { to_table: :road_dots }
      t.references   :road_dot_to, primary: true, foreign_key: { to_table: :road_dots }
    end
  end
end
