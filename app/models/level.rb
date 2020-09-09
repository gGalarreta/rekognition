class Level < ApplicationRecord

  has_many :users
  has_many :promotions

end
