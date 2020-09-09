class FavoriteStore < ApplicationRecord

  belongs_to :user
  belongs_to :store

  def self.like current_user,params
    favorite = FavoriteStore.new params
    favorite.user = current_user
    favorite
  end

  def self.dislike current_user,params
    where(user_id: current_user).where(store_id: params[:store_id]).first.destroy
  end

end
