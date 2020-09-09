class Api::V1::RoulettesController < Api::ApiV1Controller

  skip_before_action :verify_current_user, only: [:play, :check, :promotions]

  def play
    begin
      @already_played = Roulette.play roulette_params
      render :play
    rescue Exception => e
      render json: { message: e}
    end
  end

  def check
    begin
      @already_played = Roulette.check params
      render :check
    rescue Exception => e
      render json: { message: e}
    end
  end

  def promotions
    begin
      @products = SmartTvSponsor.get_promotion_products params
      render :products
    rescue Exception => e
    end
  end

  def send_smart_tv_prize
    begin
      if Roulette.send_prize_through_email smart_tv_prize_params, current_user
        render json: { message: "Gracias por participar"}
      else
        render json: { message: "A ocurrido un error, verifique su correo"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  private
    def roulette_params
      params.require(:roulette).permit(:user_id, :smart_tv_sponsor_id)
    end

    def smart_tv_prize_params
      params.require(:smart_tv_prize).permit(:product_id)
    end
end
