class StoreEvent < ApplicationRecord

  include ImageHelper

  belongs_to :store
  belongs_to :event
  
  # This method associates the attribute ":banner" with a file attachment
  has_attached_file :banner, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached banner is banner/jpg, banner/png, etc
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/


  def self.remove_element store_event_params
    StoreEvent.where(store_id: store_event_params[:store_id], event_id: store_event_params[:event_id]).first.destroy
  end

  def self.add_element store_event_params
    store_events = StoreEvent.where(store_id: store_event_params[:store_id], event_id: store_event_params[:event_id])
    if store_events.empty?
      store_event = StoreEvent.create store_event_params
    end    
  end

end
