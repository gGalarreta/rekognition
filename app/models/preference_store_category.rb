class PreferenceStoreCategory < ApplicationRecord

  belongs_to :user
  belongs_to :store_category


  def self.like current_user, params
    preference = PreferenceStoreCategory.new params
    preference.user = current_user
    preference
  end

  def self.dislike current_user, params
    where(user_id: current_user).where(store_category_id: params[:store_category_id]).first.destroy
  end

end
