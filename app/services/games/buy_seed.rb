module Games
  class BuySeed < ApplicationService
    def call(user, plant_id)
      plant = Plant.find(plant_id)
      wallet = user.wallet
      seed_stock = SeedStock.find_or_create_by!(user: user, plant: plant)
      seed_stock.update!(count: seed_stock.count + 1)
      wallet.update!(dsc: wallet.dsc - plant.seed_price)
    end
  end
end
