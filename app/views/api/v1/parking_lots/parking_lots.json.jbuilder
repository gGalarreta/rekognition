json.parking_lots @parking_lots.zip(@states) do |parking_lot, state|
  json.partial! 'parking_lot', locals: {parking_lot: parking_lot, free: state[0], occupied: state[1]}
end