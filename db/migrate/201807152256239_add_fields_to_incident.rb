
require_relative '20180420015917_create_incidents'

class AddFieldsToIncident < ActiveRecord::Migration[5.2]
  def change

    revert CreateIncidents

    create_table(:incidents) do |t|
      t.string     :type
      t.text      :information
      t.integer   :state
      t.column    'location', 'point'
      t.integer   :mall_element_id, primary: true, foreign_key: true
      t.integer   :map_id, primary: true, foreign_key: true
      t.integer   :mall_level_id, primary: true, foreign_key: true
     
      t.string :variety
    end
  end
end
