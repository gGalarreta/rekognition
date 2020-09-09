class UserPointsMenu < ApplicationRecord
  belongs_to :user
  belongs_to :points_menu
end
