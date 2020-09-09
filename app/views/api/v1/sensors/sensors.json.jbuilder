json.sensores @sensor_logs do |sensor_log|
  json.slot       sensor_log.sensor_id
  json.estado     sensor_log.status
end