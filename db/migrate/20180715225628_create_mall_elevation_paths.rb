class CreateMallElevationPaths < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_elevation_paths do |t|
      t.integer           :mall_elevation_id_first, primary: :true
      t.integer           :mall_elevation_id_second, primary: :true
      t.references        :map, foreign_key: { to_table: :maps }
      t.string            :direction
      t.integer           :weight
      t.timestamps
    end
  end
end
