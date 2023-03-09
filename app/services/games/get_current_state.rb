module Games
  class GetCurrentState < ApplicationService
    def call(user)
      resources = Resource.where(user: user)
      plants = Plant.all
      fishes = Fish.where(user: user)
      plots = Plot.where(user: user).includes(cells: [:plant])
      wallet = user.wallet
      seed_stocks = user.seed_stocks
      user_crops = user.crops

      {
        plants: plants,
        resources: resources,
        fishes: fishes,
        plots: plots,
        wallet: wallet,
        seed_stocks: seed_stocks,
        user_crops: user_crops
      }
    end
  end
end
