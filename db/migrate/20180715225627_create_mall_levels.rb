class CreateMallLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :mall_levels do |t|
      t.references    :map, foreign_key: { to_table: :maps }
      t.string        :title
      t.text          :image
      t.float         :angle
      t.float         :opacity
      t.integer       :level
      t.column        'location', 'point'
      t.column        'projection_size', 'point'   
      t.timestamps
    end
  end
end
