json.parking_places @parking_places do |parking_place|
  json.partial! 'parking_place', parking_place: parking_place
end