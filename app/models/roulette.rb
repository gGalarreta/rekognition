class Roulette < ApplicationRecord

  def self.valid_user user
    users_id = User.all.map(&:id)
    users_id.include? user
  end

  def self.valid_sponsor sponsor
    sponsors = SmartTvSponsor.all.map(&:id)
    sponsors.include? sponsor
  end

  def self.play params
    user = params[:user_id]
    sponsor = params[:smart_tv_sponsor_id]
    if Roulette.valid_user(user) and Roulette.valid_sponsor(sponsor)
      already_played = Roulette.where(user_id: user, smart_tv_sponsor_id: sponsor).first
      unless already_played.present?
        Roulette.create(user_id: user, smart_tv_sponsor_id: sponsor)
      end
      already_played.present?
    end
  end

  def self.check params
    user = params[:user_id].to_i
    sponsor = params[:smart_tv_sponsor_id].to_i
    if Roulette.valid_user(user) and Roulette.valid_sponsor(sponsor)
      already_played = Roulette.where(user_id: user, smart_tv_sponsor_id: sponsor).first
      already_played.present?
    end
  end

  def self.send_prize_through_email product_params, current_user
    product = Product.find(product_params[:product_id])
    SmartTvPrizeMailer.smart_tv_prize(product, current_user).deliver_now
  end
end
