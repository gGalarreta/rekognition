class PointsMenu < ApplicationRecord

  has_many :user_points_menus
  has_many :users, through: :user_points_menus

end
