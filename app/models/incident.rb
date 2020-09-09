class Incident < ApplicationRecord

  enum category: [:baño_malogrado, :escalera_malograda, :piso_malogrado, :ascensor_malogrado, :tienda, :iluminacion] 
  enum state: [:active, :inactive]
  
  belongs_to :user

  before_create :set_state


  def self.search params
    incidents = Incident.search_by_category(params[:category])
  end

  def self.search_by_category incident_categories
    if incident_categories.present?
      incidents = Incident.where(category: incident_categories.split(","))
    else
      all
    end
  end

  private

    def set_state
      self.state = "active"
    end

end
