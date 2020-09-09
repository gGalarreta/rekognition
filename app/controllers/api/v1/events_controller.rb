class Api::V1::EventsController < Api::ApiV1Controller

  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    render :events
  end

  def create
    begin
      @event = Event.new event_params
      if @event.save
        render :create
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @event.errors.messages}, description: "Los atributos son invalidos", status_code: 422)
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
      if @event.update_attributes event_params
        render json: { message: "successfully updated"}
      else
        response_error(title: 'No se pudo actualizar', reasons: {base: @event.errors}, description: "Los atributos son invalidos", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

  def destroy
    begin
      @event.destroy
      render json: { message: "successfully deleted"}
    rescue Exception => e
      render json: { message: e}
    end
  end

  def banners
    begin
      @events = Event.get_banners
      render :banners
    rescue Exception => e
      render json: { message: e}
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :all_day, :initial_time, :final_time, :event_date, :banner)
    end

    def set_event
      @event = Event.find params[:id]
    end

end
