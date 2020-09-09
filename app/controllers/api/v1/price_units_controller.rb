class Api::V1::PriceUnitsController < Api::ApiV1Controller

  def index
    @price_units = PriceUnit.all
    render :price_units
  end
end
