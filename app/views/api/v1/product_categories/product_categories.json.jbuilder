json.product_categories @product_categories do |product_category|
  json.partial! 'product_category', product_category: product_category
end