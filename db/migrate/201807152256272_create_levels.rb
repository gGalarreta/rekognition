class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string  :description
      t.float   :max_points
      t.timestamps
    end
  end
end
