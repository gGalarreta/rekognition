class AddEndTimeToUserPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :user_places, :end_time, :datetime  
  end
end
