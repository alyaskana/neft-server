module Stashes
  class GetStash < ApplicationService
    def call(user)
      resources = Resource.find_by(user: user)
      seeds = Seed.find_by(user: user)
      {
        resources: resources,
        seeds: seeds
      }
    end
  end
end
