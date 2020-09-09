class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.text          :description
      t.text          :image
      t.string        :state
      t.string        :title
      t.timestamps
    end
  end
end
