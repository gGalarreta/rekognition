class Api::V1::SmartTvSponsorsController < Api::ApiV1Controller

  before_action :set_smart_tv_sponsor, only: [:update, :show, :destroy]
  skip_before_action :verify_current_user, only: [:index, :create, :update, :show, :destroy]

  def index
    @smart_tv_sponsors = SmartTvSponsor.all
    render :smart_tv_sponsors
  end

  def create
    begin
      @smart_tv_sponsor = SmartTvSponsor.new smart_tv_sponsor_params
      if @smart_tv_sponsor.add_stores_and_save params[:smart_tv_sponsor][:stores]
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: "El objeto contiene atributos invalidos"}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def update
    begin
      if @smart_tv_sponsor.update smart_tv_sponsor_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @smart_tv_sponsor.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
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
      @smart_tv_sponsor.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  private

    def smart_tv_sponsor_params
      params.require(:smart_tv_sponsor).permit(:name, :video_url, :image_frame, background_color_attributes: background_color_params)
    end

    def background_color_params
      [:hexadecimal_color, :description]
    end

    def set_smart_tv_sponsor
      @smart_tv_sponsor =  SmartTvSponsor.find params[:id]
    end
end
