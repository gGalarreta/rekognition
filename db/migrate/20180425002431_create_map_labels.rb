class CreateMapLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :map_labels do |t|
      t.belongs_to :parking_level
      t.belongs_to :parking_lot
      t.text       :description
      t.text       :label_type
      t.attachment :image
      t.timestamps
    end
  end
end
