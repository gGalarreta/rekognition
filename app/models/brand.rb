class Brand < ApplicationRecord

  has_many :products, dependent: :destroy
  
  validates :name, presence: true
  validates :corporation_name, presence: true

end
