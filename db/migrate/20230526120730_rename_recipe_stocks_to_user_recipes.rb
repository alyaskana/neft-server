class RenameRecipeStocksToUserRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipe_stocks, :user_recipes
  end
end
