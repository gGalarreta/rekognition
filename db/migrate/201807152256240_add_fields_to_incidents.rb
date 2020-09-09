require_relative '20180420015917_create_incidents'

class AddFieldsToIncidents < ActiveRecord::Migration[5.2]
  def change
    revert CreateIncidents

    create_table(:incidents) do |t|
      t.string    :type
      t.text      :information
      t.text      :state
      t.column    'location', 'point'
      t.references    :map, foreign_key: { to_table: :maps }
      t.references    :mall_level, foreign_key: { to_table: :mall_levels }
      t.references    :mall_element, foreign_key: { to_table: :mall_elements }
      t.references    :user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
