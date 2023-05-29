module Games
  class PlantSeed < ApplicationService
    def call(cell_id, seed_stock_id)
      cell = Cell.find(cell_id)
      return if cell.land_type != 'garden_bed'

      seed_stock = SeedStock.find(seed_stock_id)
      return if seed_stock.count <= 0

      user = seed_stock.user
      plant = seed_stock.plant

      final_grow_time = Time.now + plant.growing_time
      call_job_time = Time.now + plant.growing_time / 20 - 2

      grownig_seed = GrowingSeed.create!(user: user, cell: cell, plant: plant, growing_time: plant.growing_time,
                                         final_grow_time: Time.now + plant.growing_time)
      seed_stock.update!(count: seed_stock.count - 1)
      GrowSeedJob.set(wait_until: grownig_seed.final_grow_time).perform_later(grownig_seed)
    end
  end
end
