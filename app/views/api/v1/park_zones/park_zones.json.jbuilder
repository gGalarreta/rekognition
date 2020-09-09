json.park_zones @park_zones.zip(@states) do |park_zone, state|
  json.partial! 'park_zone', locals: {park_zone: park_zone, free: state[0], occupied: state[1]}
end