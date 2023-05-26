class RemoveCountFromRecipeStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_stocks, :count, :integer
  end
end
