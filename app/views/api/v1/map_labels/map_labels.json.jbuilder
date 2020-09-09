json.map_labels @map_labels do |map_label|
  json.partial! 'map_label', map_label: map_label
end