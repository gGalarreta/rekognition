class ReviewedProduct < ApplicationRecord

  def self.initialize current_user, product
    store = Product.find(product).store
    store_category = StoreCategory.joins("INNER JOIN store_store_categories ON store_categories.id = store_store_categories.store_category_id").where("store_store_categories.store_id = ?", store)
    if store_category.first.present?
      reviewed = ReviewedProduct.new(user_id: current_user.id, store_category_id: store_category.first.id)
      reviewed.save
    else
      false
    end
  end
end
