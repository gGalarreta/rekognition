class Api::V1::ParkingLevelsController < Api::ApiV1Controller

  before_action :set_parking_level, only: [:show, :set_image_level]

  def index
    begin
      @parking_levels = ParkingLevel.all
      unless @parking_levels.empty?
        @states = ParkingLevel.calculate_all_states @parking_levels
        render :parking_levels
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def search
    begin
      @parking_levels = ParkingLevel.search search_params
      unless @parking_levels.empty?
        @states = ParkingLevel.calculate_all_states @parking_levels
        render :parking_levels
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def show
    begin
      @state = ParkingLevel.calculate_states @parking_level.id
      render :show
    rescue Exception => e
      render json: {message: e}
    end
  end

  def create
    @parking_level = ParkingLevel.create parking_level_params
    if @parking_level.save
      render :show
    else
      response_error(title: 'No se pudo registrar', reasons: @parking_level.errors.messages, description: "Los parametros son invalidos", status_code: 422)
    end
  end

  def update
    @parking_level.assign_attributes parking_level_params
    if @parking_level.save
      render :show
    else
      response_error(title: 'No se pudo actualizar', reasons: @parking_level.errors.messages, description: "Los parametros es invalidos", status_code: 422)
    end
  end

  def set_image_level
    begin
      @parking_level.initialize_image image_params
      if @parking_level.save
        render json: { image_url: @parking_level.image_url(field: "image"), id:@parking_level.id}
      else
        response_error(title: 'No se pudo actualizar', reasons: @parking_level.errors.messages, description: "Los parametros es invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  private

    def parking_level_params
      params.require(:parking_level).permit(:parking_lot_id, :value, :image)
    end

    def search_params
      params.permit(:parking_level_id)
    end

    def set_parking_level
      @parking_level = ParkingLevel.find params[:id]
    end

    def image_params
      params.require(:image_level).permit(:data, :content_type, :filename)
    end
end
