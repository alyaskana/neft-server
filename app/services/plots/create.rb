module Plots
  class Create < ApplicationService
    def call(user)
      plot = Plot.create!(user: user)
      25.times do
        Cell.create!(plot: plot, land_type: Cell.land_types.values.sample)
      end
    end
  end
end
