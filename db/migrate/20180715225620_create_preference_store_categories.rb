class CreatePreferenceStoreCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :preference_store_categories do |t|
      t.belongs_to  :user
      t.belongs_to  :store_category
      t.timestamps
    end
  end
end
