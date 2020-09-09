json.products @products do |product|
  json.partial! 'api/v1/products/product', product: product
  json.store do
    json.partial! 'api/v1/stores/store', store: product.store
  end
  json.brand do
    json.partial! 'api/v1/brands/brand', brand: product.brand
  end
  if product.promotion.present?
    json.promotion do
      json.partial! 'api/v1/promotions/promotion', promotion: product.promotion
    end
  else
    json.promotion do
      json.id       json.null
    end
  end
  json.product_category do
    json.partial! '/api/v1/product_categories/product_category', product_category: product.product_category
  end
end