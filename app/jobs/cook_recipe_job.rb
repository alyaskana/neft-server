class CookRecipeJob < ApplicationJob
  include ChannelHelper
  queue_as :default

  def perform(dish, user_recipe)
    dish.update!(count: dish.count + 1)
    user_recipe.update!(stage: 'ready')
    user = user_recipe.user
    message = {
      type: 'updateDishes',
      data: render_json(
        template: 'api/games/cook_complete',
        locals: { dishes: user.dishes, user_recipes: user.user_recipes }
      )
    }

    GameChannel.broadcast_to(user, message)
  end
end
