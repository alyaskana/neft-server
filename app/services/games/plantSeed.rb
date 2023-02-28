module Games
  class PlantSeed < ApplicationService
    def call(cell_id, seed_stock_id)
      cell = Cell.find(cell_id)
      return if cell.land_type != 'garden_bed'

      seed_stock = SeedStock.find(seed_stock_id)
      return if seed_stock.count <= 0

      user = seed_stock.user
      seed = seed_stock.seed
      GrowingSeed.create!(user: user, cell: cell, seed: seed, growing_time: seed.growing_time)
      seed_stock.update!(count: seed_stock.count - 1)
    end
  end
end
