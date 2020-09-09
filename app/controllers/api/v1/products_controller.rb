class Api::V1::ProductsController < Api::ApiV1Controller

  before_action :set_product, only: [:update, :show, :destroy]
  before_action :set_size, only: [:index, :create, :update, :show, :favorites, :like, :dislike, :my_products, :reviewed_products]

  def index
    @products = Product.get_all params
    render :products
  end

  def create
    begin
      @product = Product.new product_params
      if @product.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @product.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def update
    begin
      if @product.update product_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @product.errors}, description: "Los atributos son invalidos", status_code: 422)
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

  def destroy
    begin
      @product.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  def search
    begin
      @products = Product.search params
      @size = params[:size]
      render :products
    rescue Exception => e
      render json: { message: e}
    end
  end

  def favorites
    begin
      @products = current_user.products
      unless @products.empty?
        render :products
      else
        render json: { message: "No se encontraron resultados"}
      end
      rescue Exception => e
        response_error(title: 'No se encontraron resultados', reasons: {base: @products.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def like
    begin
      @favorite_product = FavoriteProduct.like current_user,favorite_product_params
      if @favorite_product.save
        render json: { message: "Guardado como favorito"}
      else
        render json: { message: "No se pudo guardar como favorito"}
      end
      rescue Exception => e
        response_error(title: 'No se pudo guardar como favorito', reasons: {base: @favorite_product.errors}, description: "Los atributos son invalidos", status_code: 422)
    end
  end

  def dislike
    if FavoriteProduct.dislike current_user,favorite_product_params
      render json: { message: "Se borró de sus favoritos"}
    else
      render json: { message: "No se pudo borrar de sus favoritos"}
    end
  end

  def my_products
    begin
      @products = Product.my_products current_user, params
      render :products
    rescue Exception => e
      render json: { message: e}
    end
  end

  def reviewed_products
    begin
      if ReviewedProduct.initialize(current_user, params[:product])
        render json: { message: "Se guardo la revision del producto exitosamente"}
      else
        render json: { message: "No se guardo la revision del producto"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end


  private

    def product_params
      params.require(:product).permit(:image, :name, :price, :store_id, :promotion_id, :brand_id, :product_category_id, technical_specification_attributes: techinal_specification_params)
    end

    def techinal_specification_params
      [:description, :weight, :length, :height]
    end

    def set_product
      @product = Product.find params[:id]
    end

    def search_params
      params.permit(:name, :product_category, :min_price, :max_price, :only_mobile, :store_category)
    end

    def favorite_product_params
      params.require(:favorite_product).permit(:product_id)
    end

    def set_size
      @size = nil
    end
end
