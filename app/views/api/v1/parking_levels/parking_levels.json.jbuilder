json.parking_levels @parking_levels.zip(@states) do |parking_level, state|
  json.partial! 'parking_level', locals: {parking_level: parking_level, free: state[0], occupied: state[1]}
end