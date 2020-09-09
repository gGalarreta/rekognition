class Api::V1::ParkZonesController < Api::ApiV1Controller
  before_action :set_park_zone, only: [:show, :set_image_level]

  def index
    begin
      @park_zones = ParkZone.all
      unless @park_zones.empty?
        @states = ParkZone.calculate_all_states @park_zones
        render :park_zones
      else
        response_error(title: 'No se encontro resultado', reasons: {base: "No existe el id del estacionamiento"}, description: "El parametro es invalido", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def create
    @park_zone = ParkZone.new parking_zone_params
    if @park_zone.save
      render :show
    else
      response_error(title: 'Could not register', reasons: @park_zone.errors.messages, description: "There are invalid values", status_code: 422)
    end
  end

  def search
    begin
      @park_zones = ParkZone.search search_params
      unless @park_zones.empty?
        @states = ParkZone.calculate_all_states @park_zones
        render :park_zones
      else
        response_error(title: 'No se encontro resultado', reasons: {base: "No existe el id del estacionamiento"}, description: "El parametro es invalido", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def show
    begin
      @state = ParkZone.calculate_states @park_zone.id
      render :show
    rescue Exception => e
      render json: {message: e}
    end
  end

  def all
    @park_zones = ParkZone.all.limit(10)
    render :show
  end

  def set_image_level
    begin
      @park_zone.initialize_image image_params
      if @park_zone.save
        render json: { image_url: @park_zone.image_url(field: "image"), id: @park_zone.id}
      else
        response_error(title: 'No se pudo actualizar', reasons: @park_zone.errors.messages, description: "Los parametros es invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  private 
    def parking_zone_params
        params.require(:park_zone).permit(:description)
    end

    def search_params
      params.permit(:park_zone_id)
    end
    
    def image_params
      params.require(:image_level).permit(:data, :content_type, :filename)
    end

    def set_park_zone
      @park_zone = ParkZone.find params[:id]
    end
end
