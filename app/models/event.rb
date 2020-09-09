class Event < ApplicationRecord

  include DateHelper
  include ImageHelper

  MESES = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Setiembre","Octubre","Noviembre","Diciembre"]

  has_many :store_events
  has_many :stores, through: :store_events, dependent: :destroy

  # This method associates the attribute ":banner" with a file attachment
  has_attached_file :banner, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached banner is banner/jpg, banner/png, etc
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def self.get_banners
    current_date = Date.today
    events = Event.where("event_date>= ?",current_date).order('event_date').limit(5)
    if events.empty?
      events = Event.none
    end
    events
  end

end
