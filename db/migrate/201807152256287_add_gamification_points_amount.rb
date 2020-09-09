class AddGamificationPointsAmount < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gamification_points_amount, :integer
  end
end
