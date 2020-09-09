class Api::V1::ParkingLotsController < Api::ApiV1Controller

  before_action :set_parking_lot, only: [:show, :set_logo]

  def index
    begin
      @parking_lots = ParkingLot.all
      unless @parking_lots.empty?
        @states = ParkingLot.calculate_all_states @parking_lots
        render :parking_lots
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
    
  end

  def create
    @parking_lot = ParkingLot.new parking_lot_params
    if @parking_lot.save
      render :show
    else
      response_error(title: 'No se pudo registrar', reasons: @parking_lot.errors.messages, description: "Los parametros son invalidos", status_code: 422)
    end
  end

  def show
    begin
      @state = ParkingLot.calculate_states @parking_lot.id
      render :show
    rescue Exception => e
      response_error(title: 'No se encontro resultado', reasons: {base: "No existe el id del estacionamiento"}, description: "El parametro es invalido", status_code: 422)
    end
  end

  def set_logo
    begin
      @parking_lot.initialize_image image_params
      if @parking_lot.save
        render json: { image_url: @parking_lot.image_url(field: "image"), id:@parking_lot.id}
      else
        response_error(title: 'No se pudo actualizar', reasons: @parking_lot.errors.messages, description: "Los parametros es invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  private

    def parking_lot_params
      params.require(:parking_lot).permit(:description, :n_levels, :x_size, :y_size)
    end

    def set_parking_lot
      @parking_lot = ParkingLot.find params[:id]
    end

    def image_params
      params.require(:image_logo).permit(:data, :content_type, :filename)
    end
end
