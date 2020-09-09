namespace :parking_places do
  task :update_parking_places => :environment do
    while true do
      SensorLog.test
      sleep(10)
    end
  end
end