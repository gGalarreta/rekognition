class Api::V1::PromotionsController < Api::ApiV1Controller

  before_action :set_promotion, only: [:show, :update, :destroy]


  def index
    @promotions = Promotion.where(store_id: params[:store_id])
    render :promotions  
  end

  def all_promotions
    @promotions = Promotion.get_all_uniq
    render :promotions
  end

  def create
    begin
      @promotion = Promotion.new promotion_params
      if @promotion.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @promotion.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
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
      if @promotion.update promotion_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @promotion.errors}, description: "Los atributos son invalidos", status_code: 422)
      end  
    rescue Exception => e
      render json: { message: e}
    end
  end

  def destroy
    begin
      @promotion.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  private
   
    def promotion_params
      params.require(:promotion).permit(:only_mobile, :value, :initial_date, :final_date, :store_id)   
    end

    def set_promotion
      @promotion = Promotion.find params[:id]
    end
end
