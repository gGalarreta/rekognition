class Api::V1::ProductCategoriesController < Api::ApiV1Controller

  before_action :set_product_category, only: [:show, :update, :destroy]

  def index
    begin
      @product_categories = ProductCategory.all
      render :product_categories
    rescue Exception => e
      render json: { message: e}
    end
  end

  def create
    begin
      @product_category = ProductCategory.new product_category_params
      if @product_category.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @product_category.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def update
    begin
      if @product_category.update product_category_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @product_category.errors}, description: "Los atributos son invalidos", status_code: 422)
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
      @product_category.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  private
    def product_category_params
      params.require(:product_category).permit(:name, :description)
    end

    def set_product_category
      @product_category = ProductCategory.find params[:id]
    end
end
