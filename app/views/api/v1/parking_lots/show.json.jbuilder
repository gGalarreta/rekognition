json.parking_lot do
  json.partial! 'parking_lot', locals: {parking_lot: @parking_lot, free: @state[0], occupied: @state[1]}
end