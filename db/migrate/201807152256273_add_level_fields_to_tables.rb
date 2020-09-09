class AddLevelFieldsToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :level
    add_reference :promotions, :level
  end
end
