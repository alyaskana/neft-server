module Games
  class CookRecipe < ApplicationService
    def call(user, user_recipe_id)
      user_recipe = UserRecipe.find_by(user: user, id: user_recipe_id)
      crops = user.crops
      user_recipe.recipe.recipe_plants.each do |recipe_plant|
        crop = crops.find_by(plant: recipe_plant.plant)
        crop.update!(count: crop.count - recipe_plant.count)
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'plant',
                                     message: "- #{recipe_plant.count}",
                                     createdAt: Time.now
                                   }
                                 })
      end
      final_cook_time = Time.now + user_recipe.recipe.cooking_time
      call_job_time = Time.now + user_recipe.recipe.cooking_time / 20 - 2
      user_recipe.update!(stage: 'cooking', final_cook_time: final_cook_time)
      dish = Dish.find_or_create_by!(user: user, recipe: user_recipe.recipe)
      CookRecipeJob.set(wait_until: call_job_time).perform_later(dish, user_recipe)
    end
  end
end
