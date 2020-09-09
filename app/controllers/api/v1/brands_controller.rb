class Api::V1::BrandsController < Api::ApiV1Controller

  before_action :set_brand, only: [:update, :show, :destroy]

  def index
    @brands = Brand.all
    render :brands
  end

  def create
    begin
      @brand = Brand.new brand_params
      if @brand.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @brand.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def update
    begin
      if @brand.update brand_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @brand.errors}, description: "Los atributos son invalidos", status_code: 422)
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
      @brand.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end


  private 

    def brand_params
      params.require(:brand).permit(:name, :description, :corporation_name)
    end

    def set_brand
      @brand = Brand.find params[:id]
    end
end
