class Api::V1::ParkZoneDotsController < Api::ApiV1Controller
  def index
    begin
      @park_zone_dots = ParkZoneDot.all
      unless @park_zone_dots.empty?
        render :park_zone_dots
      else
        response_error(title: 'No se encontro resultado', reasons: {base: "No existe el id del estacionamiento"}, description: "El parametro es invalido", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def search_by_level
    begin
      @park_zone_dots = ParkZoneDot.search_by_level search_params
      unless @park_zone_dots.empty?
        render :park_zone_dots
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  private
    def search_params
      params.permit(:park_zone_dot_id)
    end

end
