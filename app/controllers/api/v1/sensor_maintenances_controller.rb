class Api::V1::SensorMaintenancesController < ApplicationController

    def create
        @sensor_maintenance = SensorMaintenance.new sensor_maintenance_params

        if @parking_place.save
            render :show
        else
            response_error(title: 'Could not register', reasons: @sensor_maintenance_params.errors.messages, description: "There are invalid values", status_code: 422)
        end

    end

    def all
        @sensor_maintenances = SensorMaintenance.all.limit(10)
        render :sensor_maintenances
    end

    private 
        def sensor_maintenance_params
            params.require(:sensor_maintenance).permit(:parking_sensor_id, :parking_place_id, :parking_level_id, :parking_lot_id, :maintenance_date, :description, :recording_user)
        end
end
