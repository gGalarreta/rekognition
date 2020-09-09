class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string    :name
      t.string    :description
      t.string    :webpage
      t.string    :contact_name
      t.string    :phone_number
      t.timestamps
    end
  end
end
