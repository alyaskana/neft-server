class ExploreJob < ApplicationJob
  include ChannelHelper
  queue_as :default

  def perform(fish)
    user = fish.user
    UserRecipe.create!(user: user, recipe: Recipe.first)
    seed_stock = user.seed_stocks.second
    seed_stock.update!(count: seed_stock.count + 3)
    fish.update!(explore_stage: 'explore_ready')
    message = {
      type: 'exploreReady',
      data: render_json(
        template: 'api/games/explore_ready',
        locals: { fishes: user.fishes, seed_stocks: user.seed_stocks, user_recipes: user.user_recipes }
      )
    }

    GameChannel.broadcast_to(user, message)
  end
end
