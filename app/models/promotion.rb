class Promotion < ApplicationRecord
  
  include DateHelper

  belongs_to :store
  belongs_to :level, required: false
  has_many :products, dependent: :destroy


  def self.get_all_uniq
    promotions = []
    Promotion.pluck(:value).uniq.each do |promotion|
      promotions << Promotion.where(value: promotion).first
    end
    promotions
  end
end
