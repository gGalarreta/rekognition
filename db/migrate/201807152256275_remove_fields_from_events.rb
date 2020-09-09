class RemoveFieldsFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :initial_date, :date
    remove_column :events, :final_date, :date
  end
end
