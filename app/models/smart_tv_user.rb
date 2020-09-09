class SmartTvUser < ApplicationRecord
  
  has_many :user_sponsors
  has_many :smart_tv_sponsors, through: :user_sponsors

  validates :user_tv, uniqueness: true
  
  def authenticate password
    self.password_tv == password
  end

  def set_sponsor_tv_event params
    sponsor_id = params[:smart_tv_sponsor_id]
    date = params[:event_date].to_date
    has_event = UserSponsor.where(smart_tv_user_id: self.id, event_date: date).empty?
    if has_event
      UserSponsor.create(smart_tv_user_id: self.id, smart_tv_sponsor_id: sponsor_id, event_date: date)
    end
    has_event
  end

  def find_sponsors params
    date = params[:event_date].to_date
    user = self.id
    sponsor = SmartTvSponsor.joins("INNER JOIN user_sponsors ON smart_tv_sponsors.id = user_sponsors.smart_tv_sponsor_id").where("user_sponsors.event_date = ? AND user_sponsors.smart_tv_user_id = ?", date, user).first
  end
end
