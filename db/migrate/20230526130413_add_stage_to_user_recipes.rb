class AddStageToUserRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :user_recipes, :stage, :string, default: 'ready'
  end
end
