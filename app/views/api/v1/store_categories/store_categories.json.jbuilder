json.store_categories @store_categories do |store_category|
  json.partial! 'store_category', store_category: store_category
end