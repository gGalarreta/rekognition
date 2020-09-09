class Api::V1::ImagesController < Api::ApiV1Controller

  def url
    begin
      model = params[:table].titleize.delete(' ')
      field = params[:field]
      value = params[:value]
      query = field + "_file_name = ?"
      element = model.constantize.where(query, value).first
      if element
        render json: { image_url: element.image_url(field: field)}
      else
        render json: { message: "No se encontro el producto"}
      end
    rescue Exception => e
      render json: { message: e}
    end
  end

end
