class GrowSeedJob < ApplicationJob
  queue_as :default

  def perform(grownig_seed)
    grownig_seed.update!(stage: 'complete')
  end
end
