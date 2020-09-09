class Api::V1::IncidentsController < Api::ApiV1Controller

  def index
    @incidents = Incident.categories.keys.map{|x| x.gsub(/_/," ")}
    render :incident_types
  end

  def create
    begin
      @incident = current_user.incidents.build(incident_params)
      if @incident.save
        render :show
      else
        response_error(title: 'No se pudo registrar', reasons: {base: @incident.errors}, description: "El parametro es invalido", status_code: 422)
      end     
    rescue Exception => e
      render json: { message: e}
    end

  end

  def all
    @incidents = Incident.all.limit(10)
    render :incidents
  end

  def me
    @incidents = current_user.incidents
    render :incidents
  end

  def search
    begin
      @incidents = Incident.search search_params
      unless search_params.present? and @incidents.empty?
        render :incidents
      else
        response_error(title: "No se encontraron resultados", reasons: {base: "error en el parametro"}, description: "bad request", status_code: 422)
      end
    rescue Exception => e
      render json: { message: e}
    end

  end


  private

    def incident_params
      params.require(:incident).permit(:category, :description)
    end

    def search_params
      params.permit(:category)
    end
end
