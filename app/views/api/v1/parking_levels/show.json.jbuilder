json.parking_level do
  json.partial! 'parking_level', locals: {parking_level: @parking_level, free: @state[0], occupied: @state[1]}
end