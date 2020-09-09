class Api::V1::SensorsController < Api::ApiV1Controller

  skip_before_action :verify_current_user, only: [:index, :create, :update, :show, :destroy]

  def index
    begin
      @sensor_logs = SensorLog.all
      render :sensors
    rescue Exception => e
      render json: {message: e}
    end
  end

end
