class Api::V1::PointsMenusController < Api::ApiV1Controller

  def index
    begin
      @points_menus = PointsMenu.all
      render :points_menus
    rescue Exception => e
      render json: {message: e }
    end
  end
  
end
