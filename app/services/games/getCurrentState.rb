module Games
  class GetCurrentState < ApplicationService
    def call(user)
      resources = Resource.where(user: user)
      seeds = Seed.all
      plants = Plant.all
      fishes = Fish.where(user: user)
      plots = Plot.where(user: user)
      wallet = user.wallet
      user_seeds = user.seeds
      user_crops = user.crops

      {
        plants: plants,
        resources: resources,
        seeds: seeds,
        fishes: fishes,
        plots: plots,
        wallet: wallet,
        user_seeds: user_seeds,
        user_crops: user_crops
      }
    end
  end
end
