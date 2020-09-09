json.store do
  json.partial! 'store', store: @store
  json.store_categories @store.store_categories do |store_category|
    json.partial! '/api/v1/store_categories/store_category', store_category: store_category
  end
end