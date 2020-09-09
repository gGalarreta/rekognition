class AddTimeToUserPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_places, :start_time, :date
    add_column :user_places, :start_time, :datetime
  end
end
