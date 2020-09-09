class AddIconToStoreCategory < ActiveRecord::Migration[5.2]
  def change
    add_attachment :store_categories, :icon
  end
end
