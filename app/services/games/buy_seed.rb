module Games
  class BuySeed < ApplicationService
    def call(user, plant_id)
      plant = Plant.find(plant_id)
      wallet = user.wallet
      seed_stock = SeedStock.find_or_create_by!(user: user, plant: plant) do |seed_stock|
        seed_stock.count = 0
      end
      if (wallet.dsc - plant.seed_price) >= 0
        seed_stock.update!(count: seed_stock.count + 1)
        wallet.update!(dsc: wallet.dsc - plant.seed_price)
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'seed',
                                     message: '+ 1',
                                     createdAt: Time.now
                                   }
                                 })
        GameChannel.broadcast_to(user, {
                                   type: 'newNotification',
                                   data: {
                                     icon: 'money',
                                     message: "- #{plant.seed_price}",
                                     createdAt: Time.now
                                   }
                                 })
      end
    end
  end
end
