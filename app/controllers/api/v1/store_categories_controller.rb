class Api::V1::StoreCategoriesController < Api::ApiV1Controller

  before_action :set_store_category, only: [:show, :update, :destroy]

  def index
    @store_categories = StoreCategory.all
    render :store_categories
  end

  def search
    begin
      @store_categories = StoreCategory.search search_params
      render :store_categories
    rescue Exception => e
      render json: { message: e}
    end
  end

  def create
    begin
      @store_category = StoreCategory.new store_category_params
      if @store_category.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @store_category.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
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

  def update
    begin
      if @store_category.update_attributes store_category_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @product.errors}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def destroy
    begin
      @store_category.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  def preferences
    begin
      @store_categories = current_user.store_categories
      unless @store_categories.empty?
        render :store_categories
      else
        render json: { message: "No se encontraron resultados"}
      end
      rescue Exception => e
        response_error(title: 'No se encontraron resultados', reasons: {base: @store_categories.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def like
    begin
      @preference_store_category = PreferenceStoreCategory.like current_user,preference_store_category_params
      if @preference_store_category.save
        render json: { message: "Guardado como favorito"}
      else
        render json: { message: "No se pudo guardar como favorito"}
      end
      rescue Exception => e
        response_error(title: 'No se pudo guardar como favorito', reasons: {base: @preference_store_category.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def dislike
    if PreferenceStoreCategory.dislike current_user,preference_store_category_params
      render json: { message: "Se borró de sus favoritos"}
    else
      render json: { message: "No se pudo borrar de sus favoritos"}
    end
  end


  private
    def search_params
      params.permit(:name)
    end

    def store_category_params
      params.require(:store_category).permit(:name, :description, :icon)
    end

    def preference_store_category_params
      params.require(:preference_store_category).permit(:store_category_id)
    end

    def set_store_category
      @store_category = StoreCategory.find params[:id]
    end

end
