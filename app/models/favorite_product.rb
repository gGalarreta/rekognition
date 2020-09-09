class FavoriteProduct < ApplicationRecord

  belongs_to :user
  belongs_to :product

  def self.like current_user,params
    favorite = FavoriteProduct.new params
    favorite.user = current_user
    favorite
  end

  def self.dislike current_user,params
    where(user_id: current_user).where(product_id: params[:product_id]).first.destroy
  end
end
