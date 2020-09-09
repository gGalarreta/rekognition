class Api::V1::MapLabelsController < Api::ApiV1Controller

  def create
    @map_label = MapLabel.new map_label_params
    if @map_label.save
      render :show
    else
      response_error(title: 'No se pudo registrar', reasons: @map_label.errors.messages, description: "Los parametros es invalidos", status_code: 422)
    end
  end

  def update
    @map_label.assign_attributes road_params
    if @map_label.save
      render :show
    else
      response_error(title: 'No se pudo actualizar', reasons: @map_label.errors.messages, description: "Los parametros es invalidos", status_code: 422)
    end
  end

  def search
    begin
      @map_labels = MapLabel.search search_params
      render :map_labels
    rescue Exception => e
      response_error(title: 'No se encontro resultado', reasons: {base: "No existe el id del nivel del estacionamiento"}, description: "El parametro es invalido", status_code: 422)
    end
  end

  private

    def map_label_params
      params.require(:map_label).permit(:parking_lot_id, :parking_level_id, :description, :label_type, :image)
    end

    def search_params
      params.permit(:parking_lot_id, :parking_level_id)
    end

    def set_map_label
      @map_labels = MapLabel.find params[:id]
    end

end
