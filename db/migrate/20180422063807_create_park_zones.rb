class CreateParkZones < ActiveRecord::Migration[5.2]
  def change
    
    create_table :park_zones do |t|
      t.text :description

      t.timestamps
    end
  end
end
