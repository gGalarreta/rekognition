json.park_zone do
    json.partial! 'park_zone', locals: {park_zone: @park_zone, free: @state[0], occupied: @state[1]}
end