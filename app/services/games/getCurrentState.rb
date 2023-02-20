module Games
  class GetCurrentState < ApplicationService
    def call(user)
      resources = Resource.where(user: user)
      seeds = Seed.where(user: user)
      fishes = Fish.where(user: user)
      plants = Plant.all
      plots = Plot.where(user: user)

      {
        plants: plants,
        resources: resources,
        seeds: seeds,
        fishes: fishes,
        plots: plots
      }
    end
  end
end