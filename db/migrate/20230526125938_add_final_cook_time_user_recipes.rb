class AddFinalCookTimeUserRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :user_recipes, :final_cook_time, :datetime
  end
end
