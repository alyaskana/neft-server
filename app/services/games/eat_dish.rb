module Games
  class EatDish < ApplicationService
    def call(user, dish_id, fish_id)
      dish = Dish.find_by(user: user, id: dish_id)
      if (dish.count - 1) >= 0
        fish = Fish.find_by(user: user, id: fish_id)
        xp = fish.experience + dish.recipe.experience
        fish.update!(experience: xp, level: (0.05 * Math.sqrt(xp) + 1).to_i)
        dish.update!(count: dish.count - 1)

        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'dish',
                                     message: '- 1',
                                     createdAt: Time.now
                                   }
                                 })
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'experience',
                                     message: "+ #{xp} XP",
                                     createdAt: Time.now
                                   }
                                 })
      end
    end
  end
end
