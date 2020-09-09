class CreateStoreStoreCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :store_store_categories do |t|
      t.belongs_to :store
      t.belongs_to :store_category
      t.timestamps
    end
  end
end
