class Api::V1::RoadDotsController < Api::ApiV1Controller
  def index
    @road_dots = RoadDot.all
    render :road_dots
  end

  def search
    begin
      @road_dots = RoadDot.search search_params
      unless @road_dots.empty?
        render :road_dots
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def generate_route
    begin
      @points = RoadDot.generate_route generate_route_params
      unless @points.empty?
        render :routes
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  private
    def search_params
      params.permit(:road_dot_id)
    end

    def generate_route_params
      params.permit(:entry_id, :zone_id)
    end
end
