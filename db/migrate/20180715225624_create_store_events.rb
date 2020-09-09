class CreateStoreEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :store_events do |t|
      t.belongs_to :store
      t.belongs_to :event
      t.attachment :banner
      t.timestamps
    end
  end
end
