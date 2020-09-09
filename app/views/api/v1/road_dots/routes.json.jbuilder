json.parking_path @points do |point|
  json.partial! 'route', route: point[0]
  json.node_list point[1] do |trace|
    json.partial! 'trace', trace: trace
  end
end