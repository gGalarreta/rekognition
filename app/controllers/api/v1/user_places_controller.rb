class Api::V1::UserPlacesController < Api::ApiV1Controller

  def index
    @user_places = UserPlace.all
    render :user_places
  end

  def create
    begin
      @user_place = UserPlace.new_user_place user_place_params
      if @user_place.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @user_place.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def search
    begin
      @user_places = UserPlace.search search_params
      unless @user_places.empty?
        render :user_places
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "Error en la búsqueda", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  private
    def user_place_params
      params.require(:user_place).permit(:user_id, :parking_place_id)
    end

    def search_params
      params.permit(:user_place_id)
    end
end