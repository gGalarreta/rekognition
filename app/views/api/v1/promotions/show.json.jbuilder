json.promotion do
  json.partial! 'promotion', promotion: @promotion
  json.store do
    json.partial! 'api/v1/stores/store', store: @promotion.store
  end
end