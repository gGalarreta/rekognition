json.price_units @price_units do |price_unit|
  json.partial! 'price_unit', price_unit: price_unit
end