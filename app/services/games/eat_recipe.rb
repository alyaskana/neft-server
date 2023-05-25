module Games
  class EatRecipe < ApplicationService
    def call(user, recipe_stock_id, fish_id)
      recipe_stock = RecipeStock.find_by(user: user, id: recipe_stock_id)
      if (recipe_stock.count - 1) >= 0
        fish = Fish.find_by(user: user, id: fish_id)
        xp = fish.experience + recipe_stock.recipe.experience
        fish.update!(experience: xp, level: (0.05 * Math.sqrt(xp) + 1).to_i)
        recipe_stock.update!(count: recipe_stock.count - 1)
      end
    end
  end
end
