class Api::V1::StoresController < Api::ApiV1Controller

  before_action :set_store, only: [:show, :update, :destroy]

  def index
    @stores = Store.all
    render :stores
  end

  def search
    begin
      @stores = Store.search search_params
      render :stores
    rescue Exception => e
      render json: { message: e}
    end
  end

  def show
    begin
      render :show
    rescue Exception => e
      render json: { message: e}
    end
  end

  def create
    begin
      @store = Store.new store_params
      if @store.add_categories_and_save params
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @store.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def update
    begin
      if @store.validate_categories_and_update store_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @store.errors}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end  
  end

  def destroy
    begin
      @store.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end  
  end

  def favorites
    begin
      @stores = current_user.stores
      unless @stores.empty?
        render :stores
      else
        render json: { message: "No se encontraron resultados"}
      end
      rescue Exception => e
        response_error(title: 'No se encontraron resultados', reasons: {base: @stores.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def like
    begin
      @favorite_store = FavoriteStore.like current_user,favorite_store_params
      if @favorite_store.save
        render json: { message: "Guardado como favorito"}
      else
        render json: { message: "No se pudo guardar como favorito"}
      end
      rescue Exception => e
        response_error(title: 'No se pudo guardar como favorito', reasons: {base: @favorite_store.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def dislike
    if FavoriteStore.dislike current_user,favorite_store_params
      render json: { message: "Se borró de sus favoritos"}
    else
      render json: { message: "No se pudo borrar de sus favoritos"}
    end
  end

  private
    def set_store
      @store = Store.find params[:id]
    end

    def search_params
      params.permit(:store_category, :name, :webpage)
    end

    def store_params
      params.require(:store).permit(:name, :description, :webpage, :contact_name, :phone_number, :admin_id, :logo, :banner)
    end

    def favorite_store_params
      params.require(:favorite_store).permit(:store_id)
    end
end
