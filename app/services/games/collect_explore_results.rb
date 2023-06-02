module Games
  class CollectExploreResults < ApplicationService
    def call(user)
      fish = user.fishes.find_by(is_active: true)
      fish.update!(explore_stage: 'calm')
      UserRecipe.find_or_create_by!(user: user, recipe: Recipe.first)
      seed_stock = SeedStock.find_or_create_by!(user: user, plant: Plant.first) do |seed_stock|
        seed_stock.count = 0
      end
      seed_stock.update!(count: seed_stock.count + 5)
      GameChannel.broadcast_to(user, {
                                 type: 'newNotification',
                                 data: {
                                   icon: 'recipe',
                                   message: '+ 1',
                                   createdAt: Time.now
                                 }
                               })
      GameChannel.broadcast_to(user, {
                                 type: 'newNotification',
                                 data: {
                                   icon: 'seed',
                                   message: '+ 5',
                                   createdAt: Time.now
                                 }
                               })
    end
  end
end
