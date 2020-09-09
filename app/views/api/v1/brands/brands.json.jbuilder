json.brands @brands do |brand|
  json.partial! 'brand', brand: brand
end