class CreateUserSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_sponsors do |t|
      t.belongs_to :smart_tv_user
      t.belongs_to :smart_tv_sponsor
      t.date       :event_date
      t.timestamps
    end
  end
end
