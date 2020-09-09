class Api::V1::ParkingPlacesController < Api::ApiV1Controller

  def create
    @parking_place = ParkingPlace.new parking_place_params
    if @parking_place.save
      render :show
    else
      response_error(title: 'Could not register', reasons: @parking_place_params.errors.messages, description: "There are invalid values", status_code: 422)
    end
  end

  def all
    @parking_places = ParkingPlace.all.limit(10)
    render :parking_places
  end

  def search
    begin
      @parking_places = ParkingPlace.search search_params
      render :parking_places
    rescue Exception => e
      render json: {message: e }
    end 
  end

  private 
    def parking_place_params
      params.require(:parking_place).permit(:parking_level_id, :parking_lot_id, :x_coord, :y_coord, :position, :park_zone_id, :state)
    end

    def search_params
      params.permit(:park_zone_id, :parking_lot_id, :parking_level_id)
    end
end
