class Api::V1::SmartTvUsersController < Api::ApiV1Controller

  skip_before_action :verify_current_user, only: [:index, :create, :update, :show, :destroy, :login, :show_sponsor_tv_event, :sponsor_tv_event, :get_tokens]

  before_action :set_smart_tv_user, only: [:update, :show, :destroy, :sponsor_tv_event, :show_sponsor_tv_event]

  def index
    @smart_tv_users = SmartTvUser.all
    render :smart_tv_users
  end

  def create
    begin
      @smart_tv_user = SmartTvUser.new smart_tv_user_params
      if @smart_tv_user.save
       render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @smart_tv_user.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
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
      if @smart_tv_user.update smart_tv_user_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @smart_tv_user.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def destroy
    begin
      @smart_tv_user.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  def login
    begin
      @smart_tv_user = SmartTvUser.find_by_user_tv(smart_tv_login_params[:user_tv])
      @valid_user = @smart_tv_user && @smart_tv_user.authenticate(smart_tv_login_params[:password_tv])
      render :login
    rescue Exception => e
      render json: { message: e}
    end
  end

  def sponsor_tv_event
    begin
      if @smart_tv_user.set_sponsor_tv_event smart_tv_sponsor_params
        render json: { message: "Se agrego con exito el evento"}
      else
        render json: { message: "Dia ocupado"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def show_sponsor_tv_event
    begin
      @smart_tv_sponsor = @smart_tv_user.find_sponsors params
      if @smart_tv_sponsor.present?
        render :smart_tv_sponsor
      else
        render json: { smart_tv_user: "null"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end


  def get_tokens  
    begin
      @session = Session.last
      render :tokens
    rescue Exception => e
      render json: { message: e}
    end
  end


  private

    def smart_tv_user_params
      params.require(:smart_tv_user).permit(:user_tv, :password_tv)
    end

    def set_smart_tv_user
      @smart_tv_user = SmartTvUser.find params[:id]
    end

    def smart_tv_login_params
      params.permit(:user_tv, :password_tv)
    end

    def smart_tv_sponsor_params
      params.require(:event).permit(:smart_tv_sponsor_id, :event_date)
    end
end
