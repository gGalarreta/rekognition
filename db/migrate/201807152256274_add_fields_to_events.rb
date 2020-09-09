class AddFieldsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :location, :string
    add_column :events, :all_day, :boolean
    add_column :events, :initial_time, :datetime, null: :true
    add_column :events, :final_time, :datetime, null: :true
    add_column :events, :event_date, :date
    add_attachment :events, :banner
  end
end
