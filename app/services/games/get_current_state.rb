module Games
  class GetCurrentState < ApplicationService
    def call(user)
      resources = Resource.where(user: user)
      plants = Plant.all
      instruments = Instrument.all
      minerals = Mineral.all
      recipes = Recipe.all
      fishes = Fish.where(user: user)
      plots = Plot.where(user: user).includes(cells: [:plant, :mineral])
      wallet = user.wallet
      seed_stocks = user.seed_stocks
      mineral_stocks = user.mineral_stocks
      user_recipes = user.user_recipes
      instrument_stocks = user.instrument_stocks
      user_crops = user.crops
      dishes = user.dishes

      {
        plants: plants,
        resources: resources,
        fishes: fishes,
        plots: plots,
        instruments: instruments,
        minerals: minerals,
        recipes: recipes,
        wallet: wallet,
        seed_stocks: seed_stocks,
        mineral_stocks: mineral_stocks,
        user_recipes: user_recipes,
        instrument_stocks: instrument_stocks,
        user_crops: user_crops,
        dishes: dishes
      }
    end
  end
end
